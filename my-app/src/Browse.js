import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import './Browse.css';

const Browse = () => {
  const [categories, setCategories] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    axios.get('http://localhost:5000/api/product-categories')
      .then(response => {
        setCategories(response.data);
      })
      .catch(error => {
        console.error('Error fetching product categories:', error);
      });
  }, []);

  const handleCategoryClick = categoryId => {
    navigate(`/category-details/${categoryId}`);
  };

  const handleSearch = event => {
    const searchText = event.target.value.toLowerCase();
    const filtered = categories.filter(category =>
      category.CATEGORY_NAME.toLowerCase().includes(searchText)
    );
    setCategories(filtered);
  };

  return (
    <div className="browse-container">
      <div className="search-bar-container">
        <input
          type="text"
          placeholder="Filter by category name"
          className="search-input"
          onChange={handleSearch}
        />
      </div>
      <div className="categories-container">
        {categories.map(category => (
          <div
            key={category.CATEGORY_ID}
            className="category-card"
            onClick={() => handleCategoryClick(category.CATEGORY_ID)}
          >
            <img src={category.CATEGORY_THUMBNAIL_URL} alt={category.CATEGORY_NAME} className="category-image"/>
            <p className="category-name">{category.CATEGORY_NAME}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Browse;
