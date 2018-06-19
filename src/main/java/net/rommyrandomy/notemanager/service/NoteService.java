package net.rommyrandomy.notemanager.service;

import net.rommyrandomy.notemanager.model.Note;

import java.util.List;

public interface NoteService {
    public void addNote(Note Note);

    public void updateNote(Note Note);

    public void removeNote(int id);

    public Note getNoteById(int id);

    public List<Note> listNotes(String key);

    void setDone(int id);
}
