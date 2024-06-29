class MyHeader extends HTMLElement {
    connectedCallback()
    {
        this.innerHTML = `
            <div class="container">
        <nav class="nav-top">
            <ul class="nav-links">
                <li><a href="#">Help |</a></li>
                <li><a href="#">Currency - AUD |</a></li>
                <li><a href="#">Corporate Gifts | </a></li>
                <li><a href="#">Partner With Us |</a></li>
                <li><a href="#">Track Order </a></li>
            </ul>
        </nav>
        <header>
            <div class="logo">
                <a href="#" class="logo"><img src="logo1.jpg" alt="Logo"></a>
            </div>
            <div class="search-btn">
                <form>
                    <div class="search">
                        <span class="search-icon material-symbols-outlined">search</span>
                        <input class="search-input" type="search" placeholder="Search">
                    </div>
                </form>
            </div>

            <div class="btn">
                <a href="#" class="d-btn"><i class="fa-solid fa-location-dot"></i> &nbsp;Delivery Location</a>
            </div>

            <div class="icon">
                <a href="login.jsp"><i class="fa-solid fa-user fa-2x"></i></a>
                <a href="#"><i class="fa-solid fa-heart fa-2x"></i></a>
                <a href="cart.jsp" class="cart-icon"><i class="fa-solid fa-cart-shopping fa-2x"></i><span class="cart-count">${cart_list.size()}</span></a>
            </div>
        </header>
        <nav class="main-menu">
            <ul class="menu-links">
                <li><a href="#">EXPRESS</a></li>
                <li><a href="#">CAKES</a></li>
                <li><a href="#">FLOWERS</a></li>
                <li class="dropdown">
                    <a href="#" class="dropbtn">PLANTS</a>
                    <div class="dropdown-content">
                        <div class="dropdown-section">
                            <h4>By Type</h4>
                            <a href="#">All Plants</a>
                            <a href="#">Indoor Plants</a>
                            <a href="#">Outdoor Plants</a>
                            <a href="#">Personalised Plants</a>
                            <a href="#">Premium Plants</a>
                            <a href="#">Low Maintenance Plants</a>
                            <a href="#">Air Purifier Plants</a>
                            <a href="#">Flowering Plants</a>
                            <a href="#">Succulent Plants</a>
                            <a href="#">New Arrivals</a>
                        </div>
                        <div class="dropdown-section">
                            <h4>By Name</h4>
                            <a href="#">Lucky Bamboo</a>
                            <a href="#">Money Plants</a>
                            <a href="#">Jade Plants</a>
                            <a href="#">Syngonium</a>
                            <a href="#">Bonsai Plants</a>
                            <a href="#">Rose Plants</a>
                            <a href="#">Cactus Plants</a>
                            <a href="#">Plant Set</a>
                        </div>
                        <div class="dropdown-section">
                            <h4>By Occasions</h4>
                            <a href="#">Birthday</a>
                            <a href="#">Anniversary</a>
                            <a href="#">Good Luck</a>
                            <a href="#">House Warming</a>
                        </div>
                        <div class="dropdown-section">
                            <h4>By Planters</h4>
                            <a href="#">Ceramic Planters</a>
                            <a href="#">Metal Planters</a>
                            <a href="#">Glass Planters</a>
                            <a href="#">Self Watering Planters</a>
                        </div>
       
                        <div class="dropdown-images">
                            <a href="#">
                                <img id="plant1" class="plant-image" src="1.png" alt="All Plants" width="200px"> 
                            </a>
                            <a href="#">
                                <img id="plant2" class="plant-image" src="2.png" alt="Indoor Plants" width="200px"> 
                            </a>
                        </div>
                        
                    </div>
                </li>
                <li><a href="#">GIFTS</a></li>
                <li><a href="#">PERSONALIZED GIFTS</a></li>
                <li><a href="#">CHOCOLATES</a></li>
                <li><a href="#">COMBOS</a></li>
                <li><a href="#">BIRTHDAY</a></li>
                <li><a href="#">ANNIVERSARY</a></li>
                <li><a href="#">OCCASIONS</a></li>
                <li><a href="#"><i class="fa fa-motorcycle"></i> 2 Hour Delivery Gifts</a></li>
            </ul>
        </nav>
    </div>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    `
    }
}

customElements.define('my-header',MyHeader)