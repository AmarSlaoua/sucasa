import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { exchangeId: Number }
  static targets = ["messages", "exchanges"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ExchangeChannel", id: this.exchangeIdValue },
      { received: (data)  => {
        console.dir(data.exchanges_infos)
        // data.exchanges_infos = JSON.stringify(data.exchanges_infos)
        // console.dir(data.message)
        this.#insertMessageAndScrollDown(data.message)
        this.#insertExchangesInfos(data.exchanges_infos)

      }}
    )
    console.log(`Subscribed to the chatroom with the id ${this.exchangeIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #insertExchangesInfos(data) {
    this.exchangesTarget.outerHTML = data
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
