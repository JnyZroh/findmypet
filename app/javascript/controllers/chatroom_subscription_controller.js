import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number, userId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageScrollDownAndResetForm(data) }
    )
  }

  disconnect () {
    this.channel.unsubscribe()
  }

  #insertMessageScrollDownAndResetForm(data) {
    var htmlObject = document.createElement('div');
    htmlObject.innerHTML = data;
    var firstDiv = htmlObject.firstChild.nextSibling;
    console.log(firstDiv.id);
    console.log(this.userIdValue);

    if (firstDiv.id != this.userIdValue) {
      console.log(data);
      var lines = data.split("\n")
      lines[0] = "  <div>"
      lines[1] = "    <div class=\"m-1 p-2 gray-bubble\">"
      data = lines.join("\n")
      console.log(data);
    }

    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.formTarget.reset()
  }
}
