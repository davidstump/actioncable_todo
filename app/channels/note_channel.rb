# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class NoteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notes"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add(data)
    note = Note.add(data["note"])
    ActionCable.server.broadcast "notes", {action: "add", note: render_note(note)}
  end

  def remove(data)
    Note.remove(data["id"])
    ActionCable.server.broadcast "notes", {action: "remove", id: data["id"]}
  end

  private

  def render_note(note)
    ApplicationController.render(partial: "notes/note", locals: {note: note})
  end
end
