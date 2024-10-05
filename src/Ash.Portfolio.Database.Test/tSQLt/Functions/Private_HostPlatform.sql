CREATE FUNCTION
    tSQLt.Private_HostPlatform()

RETURNS @returntable TABLE (
    host_platform varchar(256)
)
AS
BEGIN
    INSERT
        @returntable

    SELECT
        host_platform
    
    FROM
        sys.dm_os_host_info;

    RETURN;

END