import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    exchangeId: Number,
    currentUserId: Number
  }
  static targets = ["messages", "exchanges", "modality"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ExchangeChannel", id: this.exchangeIdValue },
      { received: (data)  => {
        console.dir(data)
        if (data.message) {
          this.#insertMessageAndScrollDown(data.message);
        }

        if (data.message_for_other_user && data.message_for_current_user){
          if (data.current_user_id === this.currentUserIdValue) {
            this.#insertMessageAndScrollDown(data.message_for_current_user);
          } else {
            this.#insertMessageAndScrollDown(data.message_for_other_user);
          }
        }

        if (data.modality_form && data.other_modality_form) {
          if (data.current_user_id === this.currentUserIdValue) {
            this.modalityTarget.outerHTML = data.modality_form;
          } else {
            this.modalityTarget.outerHTML = data.other_modality_form;
          }
        }

        if (data.confirmation_message){
          console.log(data.confirmation_message)
          this.#insertMessageAndScrollDown(data.confirmation_message.content);
        }
      }
    })
    console.log(`Subscribed to the chatroom with the id ${this.exchangeIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #insertExchangesInfos(data) {
    this.exchangesTarget.outerHTML = data
  }

  #insertModalityForm(data){
    this.modalityTarget.outerHTML = "<div>coucou</div>"
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
