import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';
import './CategoryDetails.css';
import { ReactComponent as BookmarkIcon } from './bookmark-icon.svg'; // Assuming your SVG is usable as a React component

const CategoryDetails = () => {
  const { categoryId } = useParams();
  const navigate = useNavigate();
  const [products, setProducts] = useState([]);
  const [bookmarkedProducts, setBookmarkedProducts] = useState(new Set());

  useEffect(() => {
    axios.get(`http://localhost:5000/api/product-categories/${categoryId}/products`)
      .then(response => {
        setProducts(response.data);
      })
      .catch(error => {
        console.error('Error fetching category details:', error);
      });
  }, [categoryId]);

  const handleProductClick = (productId) => {
    // Increment hit count when a product is clicked
    axios.post(`http://localhost:5000/api/products/${productId}/hit`)
      .then(() => navigate(`/product-details/${productId}`))
      .catch(error => console.error('Error incrementing product hit:', error));
  };

  const toggleBookmark = (productId, event) => {
    event.stopPropagation(); // Prevent the card click from triggering
    // Toggle bookmark state in the backend
    axios.post(`http://localhost:5000/api/products/${productId}/bookmark`)
      .then(() => {
        setBookmarkedProducts(prevBookmarkedProducts => {
          const updatedBookmarks = new Set(prevBookmarkedProducts);
          if (updatedBookmarks.has(productId)) {
            updatedBookmarks.delete(productId);
          } else {
            updatedBookmarks.add(productId);
          }
          return updatedBookmarks;
        });
      })
      .catch(error => console.error('Error toggling bookmark:', error));
  };

  return (
    <div className="category-details">
      {products.map(product => (
        <div key={product.PRODUCT_ID} className="product-card">
          <div onClick={() => handleProductClick(product.PRODUCT_ID)}>
            <img src={product.PRODUCT_THUMBNAIL_URL} alt={product.PRODUCT_DISPLAY_NAME} className="product-image" />
            <p className="product-name">{product.PRODUCT_DISPLAY_NAME}</p>
          </div>
          <button onClick={(event) => toggleBookmark(product.PRODUCT_ID, event)} className="bookmark-button">
            <BookmarkIcon className={`bookmark-icon ${bookmarkedProducts.has(product.PRODUCT_ID) ? 'bookmarked' : ''}`} />
          </button>
        </div>
      ))}
    </div>
  );
};

export default CategoryDetails;
