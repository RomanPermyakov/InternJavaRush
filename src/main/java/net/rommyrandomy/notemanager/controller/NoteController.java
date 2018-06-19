package net.rommyrandomy.notemanager.controller;

import net.rommyrandomy.notemanager.model.Note;
import net.rommyrandomy.notemanager.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class NoteController {
    private NoteService noteService;
    private List<Note> list = null;
    private int currentPage = 0;

    @Autowired
    @Qualifier(value = "noteService")
    public void setBookService(NoteService noteService) {
        this.noteService = noteService;
    }

    @RequestMapping(value = "notes", method = RequestMethod.GET)
    public String listNotes(@RequestParam(required = false) Integer page, Model model){
        model.addAttribute("note", new Note());
        if (list == null)
            list = this.noteService.listNotes("all");
        setPaging(page,model,list);

        return "notes";
    }

    @RequestMapping(value = "notes/all", method = RequestMethod.GET)
    public String listAllNotes(@RequestParam(required = false) Integer page, Model model){
        model.addAttribute("note", new Note());
        list = this.noteService.listNotes("all");
        setPaging(page,model,list);

        return "notes";
    }

    @RequestMapping(value = "/notes/add", method = RequestMethod.POST)
    public String addNote(@ModelAttribute("note") Note notes){
        if(notes.getId() == 0){
            this.noteService.addNote(notes);
        }else {
            this.noteService.updateNote(notes);
        }

        return "redirect:/notes/all";
    }

    @RequestMapping("/remove/{id}")
    public String removeNote(@PathVariable("id") int id){
        this.noteService.removeNote(id);

        return "redirect:/notes/all";
    }

    @RequestMapping("edit/{id}")
    public String editNote(@RequestParam(required = false) Integer page, @PathVariable("id") int id, Model model){
        model.addAttribute("note", this.noteService.getNoteById(id));
        list = this.noteService.listNotes("all");
        setPaging(page,model,list);

        return "notes";
    }

    @RequestMapping("done/{id}")
    public String doneTask(@PathVariable("id") int id){
        this.noteService.setDone(id);

        return "redirect:/notes/all";
    }

    @RequestMapping("/sortDate/up")
    public String sortDateUp(@RequestParam(required = false) Integer page, Model model){
        model.addAttribute("note", new Note());
        list = this.noteService.listNotes("dateUp");
        setPaging(page,model,list);
        return "notes";
    }

    @RequestMapping("/sortDate/down")
    public String sortDateDown(@RequestParam(required = false) Integer page, Model model){
        model.addAttribute("note", new Note());
        list = this.noteService.listNotes("dateDown");
        setPaging(page,model,list);
        return "notes";
    }

    @RequestMapping("/sortDone")
    public String sortDone(@RequestParam(required = false) Integer page, Model model){
        model.addAttribute("note", new Note());
        list = this.noteService.listNotes("done");
        setPaging(page,model,list);
        return "notes";
    }

    @RequestMapping("/sortNotDone")
    public String sortNotDone(@RequestParam(required = false) Integer page, Model model){
        model.addAttribute("note", new Note());
        list = this.noteService.listNotes("notDone");
        setPaging(page,model,list);
        return "notes";
    }


    private void setPaging(Integer page, Model model, List<Note> notes) {
        PagedListHolder<Note> pagedListHolder = new PagedListHolder<>(notes);
        pagedListHolder.setPageSize(10);

        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;

        model.addAttribute("page", page);
        currentPage = page;

        pagedListHolder.setPage(page - 1);
        model.addAttribute("listNotes", pagedListHolder.getPageList());
    }
}
