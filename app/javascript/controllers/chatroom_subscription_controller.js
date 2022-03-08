import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number }
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
    // var htmlObject = document.createElement('div');
    // htmlObject.innerHTML = data;
    // var firstDiv = htmlObject.firstChild.nextSibling;
    // var secondDiv = htmlObject.firstChild.nextSibling.nextSibling;
    // console.log(firstDiv);
    // console.log(secondDiv);
    console.log(data);
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.formTarget.reset()
  }
}
