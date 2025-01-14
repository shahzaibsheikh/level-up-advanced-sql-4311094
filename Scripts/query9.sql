
SELECT s.salesAmount,s.soldDate
FROM sales s
WHERE EXISTS (SELECT invt.inventoryID
                      FROM inventory invt
                      INNER JOIN model m
                        ON m.modelId = invt.modelId
                      WHERE m.EngineType = 'Electric'
                      AND invt.inventoryId = s.inventoryID );