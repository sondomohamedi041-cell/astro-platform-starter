<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📦 Inventory Management System</h1>
            <p>Track and manage your inventory with ease</p>
        </div>

        <div class="content">
            <!-- Statistics Section -->
            <div class="stats">
                <div class="stat-card">
                    <div class="stat-number" id="totalItems">51</div>
                    <div class="stat-label">Total Items</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number" id="totalValue">$16,442.49</div>
                    <div class="stat-label">Total Value</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number" id="lowStockItems">1</div>
                    <div class="stat-label">Low Stock Items</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number" id="outOfStockItems">1</div>
                    <div class="stat-label">Out of Stock</div>
                </div>
            </div>

            <!-- Add Item Form -->
            <div class="form-section">
                <h2>Add New Item</h2>
                <form id="inventoryForm" method="post" action="#">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="itemName">Item Name *</label>
                            <input type="text" id="itemName" name="itemName" required>
                        </div>
                        <div class="form-group">
                            <label for="category">Category</label>
                            <select id="category" name="category">
                                <option value="Electronics">Electronics</option>
                                <option value="Clothing">Clothing</option>
                                <option value="Food">Food</option>
                                <option value="Books">Books</option>
                                <option value="Tools">Tools</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="quantity">Quantity *</label>
                            <input type="number" id="quantity" name="quantity" min="0" required>
                        </div>
                        <div class="form-group">
                            <label for="price">Price per Unit ($)</label>
                            <input type="number" id="price" name="price" step="0.01" min="0">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="supplier">Supplier</label>
                            <input type="text" id="supplier" name="supplier">
                        </div>
                        <div class="form-group">
                            <label for="lowStockThreshold">Low Stock Threshold</label>
                            <input type="number" id="lowStockThreshold" name="lowStockThreshold" min="0" value="10">
                        </div>
                        <div class="form-group">
                            <label for="location">Storage Location</label>
                            <input type="text" id="location" name="location" placeholder="e.g., Warehouse A, Shelf 3">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea id="description" name="description" rows="3" placeholder="Item description or notes"></textarea>
                        </div>
                    </div>
                    <button type="submit" id="submitBtn">Add Item</button>
                    <button type="reset">Clear Form</button>
                </form>
            </div>

            <!-- Search and Filter Section -->
            <div class="search-section">
                <h2>Search & Filter</h2>
                <div class="search-bar">
                    <input type="text" id="searchInput" placeholder="Search by name, category, supplier...">
                    <select id="categoryFilter">
                        <option value="">All Categories</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Clothing">Clothing</option>
                        <option value="Food">Food</option>
                        <option value="Books">Books</option>
                        <option value="Tools">Tools</option>
                        <option value="Other">Other</option>
                    </select>
                    <select id="stockFilter">
                        <option value="">All Stock Levels</option>
                        <option value="inStock">In Stock</option>
                        <option value="lowStock">Low Stock</option>
                        <option value="outOfStock">Out of Stock</option>
                    </select>
                    <button type="button">Clear Filters</button>
                </div>
            </div>

            <!-- Inventory Table -->
            <div class="table-section">
                <h2>Inventory Items</h2>
                <table class="inventory-table" border="1" cellpadding="8" cellspacing="0">
                    <thead>
                        <tr style="background-color: #667eea; color: white;">
                            <th>Name</th>
                            <th>Category</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total Value</th>
                            <th>Supplier</th>
                            <th>Location</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="inventoryTableBody">
                        <tr>
                            <td><strong>Laptop Computer</strong></td>
                            <td>Electronics</td>
                            <td>15</td>
                            <td>$999.99</td>
                            <td>$14,999.85</td>
                            <td>Tech Supply Co</td>
                            <td>Warehouse A, Shelf 1</td>
                            <td>In Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                        <tr style="background-color: #fff3cd; color: #856404;">
                            <td><strong>Office Chair</strong></td>
                            <td>Other</td>
                            <td>3</td>
                            <td>$249.99</td>
                            <td>$749.97</td>
                            <td>Furniture Plus</td>
                            <td>Warehouse B, Section 2</td>
                            <td>Low Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                        <tr style="background-color: #f8d7da; color: #721c24;">
                            <td><strong>Wireless Mouse</strong></td>
                            <td>Electronics</td>
                            <td>0</td>
                            <td>$29.99</td>
                            <td>$0.00</td>
                            <td>Tech Supply Co</td>
                            <td>Warehouse A, Shelf 3</td>
                            <td>Out of Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Coffee Beans</strong></td>
                            <td>Food</td>
                            <td>25</td>
                            <td>$12.99</td>
                            <td>$324.75</td>
                            <td>Coffee Roasters Inc</td>
                            <td>Storage Room C</td>
                            <td>In Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Programming Book</strong></td>
                            <td>Books</td>
                            <td>8</td>
                            <td>$45.99</td>
                            <td>$367.92</td>
                            <td>Educational Publishers</td>
                            <td>Library Section</td>
                            <td>In Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Smartphone</strong></td>
                            <td>Electronics</td>
                            <td>12</td>
                            <td>$599.99</td>
                            <td>$7,199.88</td>
                            <td>Mobile Tech Ltd</td>
                            <td>Electronics Storage</td>
                            <td>In Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Desk Lamp</strong></td>
                            <td>Other</td>
                            <td>20</td>
                            <td>$35.50</td>
                            <td>$710.00</td>
                            <td>Lighting Solutions</td>
                            <td>Office Equipment Area</td>
                            <td>In Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                        <tr style="background-color: #fff3cd; color: #856404;">
                            <td><strong>USB Cable</strong></td>
                            <td>Electronics</td>
                            <td>5</td>
                            <td>$12.99</td>
                            <td>$64.95</td>
                            <td>Cable Co</td>
                            <td>Electronics Storage</td>
                            <td>Low Stock</td>
                            <td>
                                <button type="button">Edit</button>
                                <button type="button">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Additional Actions -->
            <div class="actions-section">
                <h2>Data Management</h2>
                <button type="button">📥 Export Data</button>
                <button type="button">📤 Import Data</button>
                <button type="button">📊 Generate Report</button>
                <button type="button">🖨️ Print Inventory</button>
                <button type="button">🔄 Refresh Data</button>
            </div>
        </div>
    </div>

    <!-- Edit Modal (Hidden) -->
    <div id="editModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5);">
        <div style="background: white; margin: 50px auto; padding: 20px; width: 80%; max-width: 500px; border-radius: 8px;">
            <h3>Edit Item</h3>
            <form id="editForm" method="post" action="#">
                <div>
                    <label for="editItemName">Item Name *</label><br>
                    <input type="text" id="editItemName" name="editItemName" required style="width: 100%; padding: 8px; margin-bottom: 10px;">
                </div>
                <div>
                    <label for="editCategory">Category</label><br>
                    <select id="editCategory" name="editCategory" style="width: 100%; padding: 8px; margin-bottom: 10px;">
                        <option value="Electronics">Electronics</option>
                        <option value="Clothing">Clothing</option>
                        <option value="Food">Food</option>
                        <option value="Books">Books</option>
                        <option value="Tools">Tools</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div>
                    <label for="editQuantity">Quantity *</label><br>
                    <input type="number" id="editQuantity" name="editQuantity" min="0" required style="width: 100%; padding: 8px; margin-bottom: 10px;">
                </div>
                <div>
                    <label for="editPrice">Price per Unit ($)</label><br>
                    <input type="number" id="editPrice" name="editPrice" step="0.01" min="0" style="width: 100%; padding: 8px; margin-bottom: 10px;">
                </div>
                <div>
                    <label for="editSupplier">Supplier</label><br>
                    <input type="text" id="editSupplier" name="editSupplier" style="width: 100%; padding: 8px; margin-bottom: 10px;">
                </div>
                <div>
                    <label for="editLocation">Storage Location</label><br>
                    <input type="text" id="editLocation" name="editLocation" style="width: 100%; padding: 8px; margin-bottom: 10px;">
                </div>
                <div>
                    <label for="editDescription">Description</label><br>
                    <textarea id="editDescription" name="editDescription" rows="3" style="width: 100%; padding: 8px; margin-bottom: 10px;"></textarea>
                </div>
                <button type="submit">Update Item</button>
                <button type="button">Cancel</button>
            </form>
        </div>
    </div>

    <!-- Reports Section -->
    <div class="reports-section">
        <h2>📈 Inventory Summary</h2>
        <div class="summary-info">
            <h3>Current Status Overview:</h3>
            <ul>
                <li><strong>Total Items in Stock:</strong> 83 units across 8 products</li>
                <li><strong>Total Inventory Value:</strong> $24,417.35</li>
                <li><strong>Items Requiring Attention:</strong> 3 items (2 low stock, 1 out of stock)</li>
                <li><strong>Most Valuable Category:</strong> Electronics ($22,264.68 - 91% of total value)</li>
                <li><strong>Active Categories:</strong> 4 (Electronics, Food, Books, Other)</li>
                <li><strong>Active Suppliers:</strong> 6 different vendors</li>
            </ul>
        </div>
        
        <div class="alerts-section">
            <h3>⚠️ Stock Alerts & Recommendations:</h3>
            <div style="background-color: #fff3cd; padding: 10px; margin: 10px 0; border-left: 4px solid #ffc107;">
                <strong>Low Stock Items:</strong>
                <ul>
                    <li>Office Chair: 3 units remaining (threshold: 5)</li>
                    <li>USB Cable: 5 units remaining (threshold: 10)</li>
                </ul>
            </div>
            <div style="background-color: #f8d7da; padding: 10px; margin: 10px 0; border-left: 4px solid #dc3545;">
                <strong>Out of Stock Items:</strong>
                <ul>
                    <li>Wireless Mouse: 0 units available - Immediate reorder required</li>
                </ul>
            </div>
        </div>

        <div class="category-breakdown">
            <h3>📋 Category Breakdown:</h3>
            <table border="1" cellpadding="8" cellspacing="0" style="width: 100%;">
                <thead>
                    <tr style="background-color: #f8f9fa;">
                        <th>Category</th>
                        <th>Items Count</th>
                        <th>Total Quantity</th>
                        <th>Total Value</th>
                        <th>Avg. Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Electronics</td>
                        <td>4</td>
                        <td>32</td>
                        <td>$22,264.68</td>
                        <td>$410.74</td>
                    </tr>
                    <tr>
                        <td>Food</td>
                        <td>1</td>
                        <td>25</td>
                        <td>$324.75</td>
                        <td>$12.99</td>
                    </tr>
                    <tr>
                        <td>Books</td>
                        <td>1</td>
                        <td>8</td>
                        <td>$367.92</td>
                        <td>$45.99</td>
                    </tr>
                    <tr>
                        <td>Other</td>
                        <td>2</td>
                        <td>23</td>
                        <td>$1,459.97</td>
                        <td>$142.75</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- System Information Footer -->
    <footer style="margin-top: 40px; padding: 20px; background-color: #f8f9fa; border-top: 1px solid #dee2e6;">
        <div class="footer-content">
            <h3>📊 System Information</h3>
            <p><strong>Last Updated:</strong> August 1, 2024, 10:30 AM</p>
            <p><strong>Database Records:</strong> 8 active items</p>
            <p><strong>System Status:</strong> <span style="color: green; font-weight: bold;">✅ Operational</span></p>
            <p><strong>Data Backup:</strong> Available for export in JSON format</p>
            <p><strong>Version:</strong> Inventory Management System v1.0</p>
        </div>
        
        <div class="instructions" style="margin-top: 20px;">
            <h3>📚 Quick Start Guide:</h3>
            <ol>
                <li><strong>Adding Items:</strong> Use the form above to add new inventory items with all details</li>
                <li><strong>Search & Filter:</strong> Find items quickly using the search bar and category filters</li>
                <li><strong>Stock Monitoring:</strong> Check the Status column for stock level warnings</li>
                <li><strong>Data Management:</strong> Export your data regularly for backup purposes</li>
                <li><strong>Editing:</strong> Click Edit next to any item to modify its information</li>
                <li><strong>Reports:</strong> Review the summary section for business insights</li>
            </ol>
        </div>
     
