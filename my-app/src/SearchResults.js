import React, { useState } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import axios from 'axios';
import './SearchResults.css';
import bookmarkIcon from './bookmark-icon.svg';

const SearchResults = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { results } = location.state || { results: [] };
  const [bookmarkedProducts, setBookmarkedProducts] = useState(new Set());

  const handleProductClick = (productId) => {
    // Increment hit count when a product is clicked
    axios.post(`http://localhost:5000/api/products/${productId}/hit`)
      .then(() => {
        navigate(`/product-details/${productId}`);
      })
      .catch(error => {
        console.error('Error incrementing product hit:', error);
      });
  };

  const toggleBookmark = (productId, event) => {
    event.stopPropagation(); // Prevent navigating to the product details page

    axios.post(`http://localhost:5000/api/products/${productId}/bookmark`)
      .then(() => {
        // Update the UI to reflect the bookmark change
        setBookmarkedProducts(prevBookmarkedProducts => {
          const newBookmarkedProducts = new Set(prevBookmarkedProducts);
          if (newBookmarkedProducts.has(productId)) {
            newBookmarkedProducts.delete(productId);
          } else {
            newBookmarkedProducts.add(productId);
          }
          return newBookmarkedProducts;
        });
      })
      .catch(error => {
        console.error('Error toggling bookmark:', error);
      });
  };

  return (
    <div className="search-results">
      <h1>Search Results</h1>
      <ul>
        {results.map(product => (
          <li key={product.PRODUCT_ID} onClick={() => handleProductClick(product.PRODUCT_ID)} className="search-result-item">
            <img src={product.PRODUCT_THUMBNAIL_URL} alt={product.PRODUCT_DISPLAY_NAME} className="search-result-image" />
            <span className="product-name">{product.PRODUCT_DISPLAY_NAME}</span>
            <button className="bookmark-button" onClick={(event) => toggleBookmark(product.PRODUCT_ID, event)}>
              <img
                src={bookmarkIcon}
                alt="Bookmark"
                className={`bookmark-icon ${bookmarkedProducts.has(product.PRODUCT_ID) ? 'bookmarked' : ''}`}
              />
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default SearchResults;
