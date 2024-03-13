import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import NavBar from './NavBar';
import Dashboard from './Dashboard';
import Browse from './Browse';
import Bookmarks from './Bookmarks';
import SearchResults from './SearchResults';
import ProductDetails from './ProductDetails';
import CategoryDetails from './CategoryDetails'; 
import Contact from './Contact';
import 'bootstrap/dist/css/bootstrap.min.css';


const App = () => {
  return (
    <Router>
      <NavBar />
      <Routes>
        <Route path="/" element={<Dashboard />} />
        <Route path="/browse" element={<Browse />} />
        <Route path="/bookmarks" element={<Bookmarks />} />
        <Route path="/search-results" element={<SearchResults />} />
        <Route path="/product-details/:productId" element={<ProductDetails />} />
        <Route path="/category-details/:categoryId" element={<CategoryDetails />} /> {/* Ensure this matches your intended path */}
        <Route path="/contact" element={<Contact />} />
      </Routes>
    </Router>
  );
};

export default App;
