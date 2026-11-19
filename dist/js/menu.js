// Interatividad de Menu
class MenuHandler{

    constructor(){
        this.init();
        this.addListeners();
    }

    init(){
        this.buttonMenu = document.querySelector(".nav-container .menu-toggle");
        this.canvasMenu = document.querySelector(".nav-container ul"); 
    }

    __replaceClass( pre, current ){

        if( this.canvasMenu.classList.contains( pre ) ){
            console.log(" contiene " + pre );
            this.canvasMenu.classList.remove(pre);
            this.canvasMenu.classList.add(current);
            console.log(`${current} añadida correctamente`);
        }else{
            console.log(`${pre} No encontrada`);
        }

    }

    addListeners(){
        
        this.buttonMenu.addEventListener('click', () => {
            const hasActived = this.buttonMenu.getAttribute("data-actived");
            const beActived = hasActived == "true" ? "false" : "true";

            if( this.canvasMenu.classList.contains( "canvas-diabled" ) ){
                this.canvasMenu.classList.remove( "canvas-diabled" );
                this.canvasMenu.classList.add("canvas-actived");
                
            }else if( this.canvasMenu.classList.contains( "canvas-actived" ) ) {
                this.canvasMenu.classList.remove( "canvas-actived" );
                this.canvasMenu.classList.add("canvas-diabled");
            }        


            this.buttonMenu.setAttribute( "data-actived", beActived );
        });
    }

}

new MenuHandler();

        