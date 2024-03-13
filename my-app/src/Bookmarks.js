import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import './Bookmarks.css';

const Bookmarks = () => {
  const [bookmarkedProducts, setBookmarkedProducts] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    fetchBookmarkedProducts();
  }, []);

  const fetchBookmarkedProducts = async () => {
    try {
      const response = await axios.get('http://localhost:5000/api/bookmarked-products');
      setBookmarkedProducts(response.data);
    } catch (error) {
      console.error("Error fetching bookmarked products: ", error);
    }
  };

  const navigateToProductDetails = productId => {
    navigate(`/product-details/${productId}`);
  };

  return (
    <div className="bookmarks-container">
      <h2>Bookmarks</h2>
      <div className="bookmarked-products-grid">
        {bookmarkedProducts.length > 0 ? (
          bookmarkedProducts.map(product => (
            <div key={product.PRODUCT_ID} className="bookmarked-product-card" onClick={() => navigateToProductDetails(product.PRODUCT_ID)}>
              <img src={product.PRODUCT_THUMBNAIL_URL} alt={product.PRODUCT_DISPLAY_NAME} className="product-thumbnail" />
              <p className="product-name">{product.PRODUCT_DISPLAY_NAME}</p>
            </div>
          ))
        ) : (
          <div className="no-favorites">
            <p>No Favorites Added</p>
            <button onClick={() => navigate('/browse')}>Browse Products</button>
          </div>
        )}
      </div>
    </div>
  );
};

export default Bookmarks;
