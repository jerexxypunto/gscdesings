class SalesCardHandler{

    constructor(){
        this.nav = document.querySelector(".sales-list");
        this.salesCardList = document.querySelectorAll(".sales-card-wrapper .sales-card");

        this.buttonClickHandler();
        this.displayCard("1");
    }

    buttonClickHandler(){

        const liItems = [...this.nav.querySelectorAll("li")];

        liItems.forEach((item) => {

            item.addEventListener("click", (e) => {
                e.preventDefault();
                const id = item.dataset.id;

                liItems.forEach((li) => {
                    li.classList.remove("active");
                });

                item.classList.add("active");

                this.displayCard(id);

            } );
        });
    }

    displayCard(id){
        const salesCardList = [...this.salesCardList];
       salesCardList.forEach((card) => {
            if (card.dataset.id === id) {
                card.classList.add("active");
            } else {
                card.classList.remove("active");
            }
        });
    }
}

new SalesCardHandler();