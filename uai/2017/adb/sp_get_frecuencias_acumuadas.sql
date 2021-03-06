USE [db_banco_uai_2017]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_get_frecuencias_acumuadas
	@anio int
AS
BEGIN
	SET NOCOUNT ON;
	CREATE TABLE #tmp
	(
		Mes int,
		Total_ingresos money
	)
	DECLARE @i int = 1;
	WHILE(@i <= 12)
		BEGIN
			INSERT INTO #tmp
			VALUES 
			(@i,
				(
					SELECT 
						SUM(movs.monto)
					FROM fin_cuentas_bancarias_movimientos movs
					WHERE
						movs.monto > 0 AND 
						YEAR(movs.fecha_hora) = @anio AND
						MONTH(movs.fecha_hora) <= @i
				)
			)
			SET @i = @i + 1
		END
	SELECT * FROM #tmp
	DROP TABLE #tmp
END
