package net.rommyrandomy.notemanager.service;

import net.rommyrandomy.notemanager.dao.NoteDao;
import net.rommyrandomy.notemanager.model.Note;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoteServiceImpl implements NoteService {
    private NoteDao noteDao;

    public void setNoteDao(NoteDao noteDao) {
        this.noteDao = noteDao;
    }

    @Override
    @Transactional
    public void addNote(Note note) {
        this.noteDao.addNote(note);
    }

    @Override
    @Transactional
    public void updateNote(Note note) {
        this.noteDao.updateNote(note);
    }

    @Override
    @Transactional
    public void removeNote(int id) {
        this.noteDao.removeNote(id);
    }

    @Override
    @Transactional
    public Note getNoteById(int id) {
        return this.noteDao.getNoteById(id);
    }

    @Override
    @Transactional
    public List<Note> listNotes(String key) {
        return this.noteDao.listNotes(key);
    }

    @Override
    @Transactional
    public void setDone(int id) {
        this.noteDao.setDone(id);
    }

}
