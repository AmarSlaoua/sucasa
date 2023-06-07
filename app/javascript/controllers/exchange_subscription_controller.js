import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { exchangeId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ExchangeChannel", id: this.exchangeIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.exchangeIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
