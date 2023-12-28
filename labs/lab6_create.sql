CREATE OR ALTER PROCEDURE [SalesLT].[uspUpdateCustomerAddress]
    @CustomerID INT, 
	@AddressType NVARCHAR(50), 
    @AddressLine NVARCHAR(50), 
    @City NVARCHAR(50), 
    @StateProvince NVARCHAR(50), 
    @CountryRegion NVARCHAR(50),  
    @PostalCode NVARCHAR(50)
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
	
	
		--	Comprobamos que el cliente referenciado existe. En caso contrario se devuelve mensaje de error 
		-- y finaliza la ejecución del procedimiento
		IF NOT EXISTS (SELECT 1 FROM SalesLT.Customer WHERE CustomerID = @CustomerID)
		BEGIN
			RAISERROR(N'Customer doesn''t exist', 16, 127) WITH NOWAIT;
			RETURN;
		END
	
		--	Iniciamos transacción para ejecutar todas las instrucciones como si fuera una sola
        BEGIN TRANSACTION;
		
		DECLARE @newAddress INT;
		
		--	Insertamos un nuevo registro
		INSERT INTO SalesLT.Address (AddressLine1, City, StateProvince, CountryRegion, PostalCode)
		VALUES (@AddressLine, @City, @StateProvince, @CountryRegion, @PostalCode)

		--	Recogemos el valor del identificador autogenerado;
		SELECT @newAddress = SCOPE_IDENTITY() ;

		--	Almacenamos la nueva relación entre Cliente y su dirección
        INSERT INTO SalesLT.CustomerAddress (CustomerID, AddressID, AddressType)            
        VALUES (@CustomerID, @newAddress, @AddressType);

		-- 	Confirmamos transacción
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- 	Cancelamos transacción en caso de que haya habido algún error		
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        DECLARE  @ErrorMessage  NVARCHAR(4000),  @ErrorSeverity INT,  @ErrorState    INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(), 
            @ErrorSeverity = ERROR_SEVERITY(), 
            @ErrorState = ERROR_STATE();
        
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
    END CATCH;
	

END;