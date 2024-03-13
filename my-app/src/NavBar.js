import React from 'react';
import { NavLink } from 'react-router-dom';
import './NavBar.css'; // Make sure the CSS file is in the same directory

const NavBar = () => {
    return (
        <nav className="navbar">
            <div className="nav-logo">Quick Resource Locator</div>
            <div className="nav-menu">
                <NavLink to="/" exact className="nav-item">Dashboard</NavLink>
                <NavLink to="/browse" className="nav-item">Browse</NavLink>
                <NavLink to="/bookmarks" className="nav-item">Bookmarks</NavLink>
                <NavLink to="/contact" className="nav-item">Contact Dell</NavLink>
            </div>
        </nav>
    );
};

export default NavBar;
