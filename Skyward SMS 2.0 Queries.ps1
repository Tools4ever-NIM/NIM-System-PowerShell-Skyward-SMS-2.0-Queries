# version: 1.3
$Log_MaskableKeys = @(
    'password',
    'connection_string'
)

#
# System functions
#
function Idm-SystemInfo {
    param (
        # Operations
        [switch] $Connection,
        [switch] $TestConnection,
        [switch] $Configuration,
        # Parameters
        [string] $ConnectionParams
    )

    Log info "-Connection=$Connection -TestConnection=$TestConnection -Configuration=$Configuration -ConnectionParams='$ConnectionParams'"
    
    if ($Connection) {
        @(
            @{
                name = 'connection_header'
                type = 'text'
                text = 'Connection'
				tooltip = 'Connection information for the database'
            }
			@{
                name = 'host_name'
                type = 'textbox'
                label = 'Server'
                description = 'IP or Hostname of Server'
                value = ''
            }
            @{
                name = 'port'
                type = 'textbox'
                label = 'Port'
                description = 'Instance port'
                value = '22501'
            }
            @{
                name = 'database'
                type = 'textbox'
                label = 'Database'
                description = 'Name of database'
                value = 'SKYWARD'
            }
             @{
                name = 'driver_version'
                type = 'textbox'
                label = 'Driver Version'
                description = 'Version of Progress OpenEdge Driver'
                value = '11.7'
            }
            
            @{
                name = 'isolation_mode'
                type = 'textbox'
                label = 'Isolation Mode'
                value = 'READ UNCOMMITTED'
            }
            @{
                name = 'array_size'
                type = 'textbox'
                label = 'Array Size'
                value = '50'
            }
            @{
                name = 'enableETWT'
                type = 'checkbox'
                label = 'Enable ETWT'
                value = $true
            }
            @{
                name = 'enableUWCT'
                type = 'checkbox'
                label = 'Enable UWCT'
                value = $true
            }
            @{
                name = 'enableKA'
                type = 'checkbox'
                label = 'Enable KA'
                value = $true
            }
			@{
                name = 'enablePacketSize'
                type = 'checkbox'
                label = 'Enable Packet Size'
                value = $false
            }
			@{
                name = 'user'
                type = 'textbox'
                label = 'Username'
                description = 'User account name to access server'
            }
            @{
                name = 'password'
                type = 'textbox'
                password = $true
                label = 'Password'
                description = 'User account password to access server'
            }
			@{
                name = 'query_timeout'
                type = 'textbox'
                label = 'Query Timeout'
                description = 'Time it takes for the query to timeout'
                value = '1800'
            }
			@{
                name = 'connection_timeout'
                type = 'textbox'
                label = 'Connection Timeout'
                description = 'Time it takes for the ODBC Connection to timeout'
                value = '3600'
            }
			@{
                name = 'vpn_header'
                type = 'text'
                text = 'VPN'
				tooltip = 'VPN to access network for database (e.g. ISCorp). Not recommended. Use Site-to-Site VPN instead'
            }
			@{
                name = 'enableVPN'
                type = 'checkbox'
                label = 'Use VPN'
                value = $false
            }
            @{
                name = 'vpnOpenPath'
                type = 'textbox'
                label = 'Open VPN Path'
                description = 'Path to script start connection to vpn'
                value = 'C:\\Tools4ever\\Scripts\\connectSkywardVPN.bat'
				disabled = '!enableVPN'
                hidden = '!enableVPN'
            }
            @{
                name = 'vpnClosePath'
                type = 'textbox'
                label = 'Close VPN Path'
                description = 'Path to script close connection to vpn'
                value = 'C:\\Tools4ever\\Scripts\\disconnectSkywardVPN.bat'
				disabled = '!enableVPN'
                hidden = '!enableVPN'
            }
			@{
                name = 'session_header'
                type = 'text'
                text = 'Session Options'
				tooltip = 'Options for system session'
            }
			@{
                name = 'nr_of_sessions'
                type = 'textbox'
                label = 'Max. number of simultaneous sessions'
                tooltip = ''
                value = 1
            }
            @{
                name = 'sessions_idle_timeout'
                type = 'textbox'
                label = 'Session cleanup idle time (minutes)'
                tooltip = ''
                value = 1
            }
			@{
                name = 'table_header'
                type = 'text'
                text = 'Tables'
				tooltip = 'Query to Table mapping'
            }
			@{
                name = 'table_1_header'
                type = 'text'
                text = 'Table 1'
				tooltip = 'Table 1 Config'
            }
            @{
                name = 'table_1_name'
                type = 'textbox'
                label = 'Table 1 Name'
                description = ''
            }
            @{
                name = 'table_1_query'
                type = 'textbox'
                label = 'Table 1 Query'
                description = ''
				disabled = '!table_1_name'
                hidden = '!table_1_name'
            }
			
			@{
				name = 'table_2_header'
				type = 'text'
				text = 'Table 2'
				tooltip = 'Table 2 Config'
				disabled = '!table_1_name'
				hidden = '!table_1_name'
			}
			@{
				name = 'table_2_name'
				type = 'textbox'
				label = 'Table 2 Name'
				description = ''
				disabled = '!table_1_name'
				hidden = '!table_1_name'
			}
			@{
				name = 'table_2_query'
				type = 'textbox'
				label = 'Table 2 Query'
				description = ''
				disabled = '!table_1_name'
				hidden = '!table_1_name'
			}

			@{
				name = 'table_3_header'
				type = 'text'
				text = 'Table 3'
				tooltip = 'Table 3 Config'
				disabled = '!table_2_name'
				hidden = '!table_2_name'
			}
			@{
				name = 'table_3_name'
				type = 'textbox'
				label = 'Table 3 Name'
				description = ''
				disabled = '!table_2_name'
				hidden = '!table_2_name'
			}
			@{
				name = 'table_3_query'
				type = 'textbox'
				label = 'Table 3 Query'
				description = ''
				disabled = '!table_2_name'
				hidden = '!table_2_name'
			}

			@{
				name = 'table_4_header'
				type = 'text'
				text = 'Table 4'
				tooltip = 'Table 4 Config'
				disabled = '!table_3_name'
				hidden = '!table_3_name'
			}
			@{
				name = 'table_4_name'
				type = 'textbox'
				label = 'Table 4 Name'
				description = ''
				disabled = '!table_3_name'
				hidden = '!table_3_name'
			}
			@{
				name = 'table_4_query'
				type = 'textbox'
				label = 'Table 4 Query'
				description = ''
				disabled = '!table_3_name'
				hidden = '!table_3_name'
			}

			@{
				name = 'table_5_header'
				type = 'text'
				text = 'Table 5'
				tooltip = 'Table 5 Config'
				disabled = '!table_4_name'
				hidden = '!table_4_name'
			}
			@{
				name = 'table_5_name'
				type = 'textbox'
				label = 'Table 5 Name'
				description = ''
				disabled = '!table_4_name'
				hidden = '!table_4_name'
			}
			@{
				name = 'table_5_query'
				type = 'textbox'
				label = 'Table 5 Query'
				description = ''
				disabled = '!table_4_name'
				hidden = '!table_4_name'
			}

			@{
				name = 'table_6_header'
				type = 'text'
				text = 'Table 6'
				tooltip = 'Table 6 Config'
				disabled = '!table_5_name'
				hidden = '!table_5_name'
			}
			@{
				name = 'table_6_name'
				type = 'textbox'
				label = 'Table 6 Name'
				description = ''
				disabled = '!table_5_name'
				hidden = '!table_5_name'
			}
			@{
				name = 'table_6_query'
				type = 'textbox'
				label = 'Table 6 Query'
				description = ''
				disabled = '!table_5_name'
				hidden = '!table_5_name'
			}

			@{
				name = 'table_7_header'
				type = 'text'
				text = 'Table 7'
				tooltip = 'Table 7 Config'
				disabled = '!table_6_name'
				hidden = '!table_6_name'
			}
			@{
				name = 'table_7_name'
				type = 'textbox'
				label = 'Table 7 Name'
				description = ''
				disabled = '!table_6_name'
				hidden = '!table_6_name'
			}
			@{
				name = 'table_7_query'
				type = 'textbox'
				label = 'Table 7 Query'
				description = ''
				disabled = '!table_6_name'
				hidden = '!table_6_name'
			}

			@{
				name = 'table_8_header'
				type = 'text'
				text = 'Table 8'
				tooltip = 'Table 8 Config'
				disabled = '!table_7_name'
				hidden = '!table_7_name'
			}
			@{
				name = 'table_8_name'
				type = 'textbox'
				label = 'Table 8 Name'
				description = ''
				disabled = '!table_7_name'
				hidden = '!table_7_name'
			}
			@{
				name = 'table_8_query'
				type = 'textbox'
				label = 'Table 8 Query'
				description = ''
				disabled = '!table_7_name'
				hidden = '!table_7_name'
			}

			@{
				name = 'table_9_header'
				type = 'text'
				text = 'Table 9'
				tooltip = 'Table 9 Config'
				disabled = '!table_8_name'
				hidden = '!table_8_name'
			}
			@{
				name = 'table_9_name'
				type = 'textbox'
				label = 'Table 9 Name'
				description = ''
				disabled = '!table_8_name'
				hidden = '!table_8_name'
			}
			@{
				name = 'table_9_query'
				type = 'textbox'
				label = 'Table 9 Query'
				description = ''
				disabled = '!table_8_name'
				hidden = '!table_8_name'
			}

			@{
				name = 'table_10_header'
				type = 'text'
				text = 'Table 10'
				tooltip = 'Table 10 Config'
				disabled = '!table_9_name'
				hidden = '!table_9_name'
			}
			@{
				name = 'table_10_name'
				type = 'textbox'
				label = 'Table 10 Name'
				description = ''
				disabled = '!table_9_name'
				hidden = '!table_9_name'
			}
			@{
				name = 'table_10_query'
				type = 'textbox'
				label = 'Table 10 Query'
				description = ''
				disabled = '!table_9_name'
				hidden = '!table_9_name'
			}

			@{
				name = 'table_11_header'
				type = 'text'
				text = 'Table 11'
				tooltip = 'Table 11 Config'
				disabled = '!table_10_name'
				hidden = '!table_10_name'
			}
			@{
				name = 'table_11_name'
				type = 'textbox'
				label = 'Table 11 Name'
				description = ''
				disabled = '!table_10_name'
				hidden = '!table_10_name'
			}
			@{
				name = 'table_11_query'
				type = 'textbox'
				label = 'Table 11 Query'
				description = ''
				disabled = '!table_10_name'
				hidden = '!table_10_name'
			}

			@{
				name = 'table_12_header'
				type = 'text'
				text = 'Table 12'
				tooltip = 'Table 12 Config'
				disabled = '!table_11_name'
				hidden = '!table_11_name'
			}
			@{
				name = 'table_12_name'
				type = 'textbox'
				label = 'Table 12 Name'
				description = ''
				disabled = '!table_11_name'
				hidden = '!table_11_name'
			}
			@{
				name = 'table_12_query'
				type = 'textbox'
				label = 'Table 12 Query'
				description = ''
				disabled = '!table_11_name'
				hidden = '!table_11_name'
			}

			@{
				name = 'table_13_header'
				type = 'text'
				text = 'Table 13'
				tooltip = 'Table 13 Config'
				disabled = '!table_12_name'
				hidden = '!table_12_name'
			}
			@{
				name = 'table_13_name'
				type = 'textbox'
				label = 'Table 13 Name'
				description = ''
				disabled = '!table_12_name'
				hidden = '!table_12_name'
			}
			@{
				name = 'table_13_query'
				type = 'textbox'
				label = 'Table 13 Query'
				description = ''
				disabled = '!table_12_name'
				hidden = '!table_12_name'
			}

			@{
				name = 'table_14_header'
				type = 'text'
				text = 'Table 14'
				tooltip = 'Table 14 Config'
				disabled = '!table_13_name'
				hidden = '!table_13_name'
			}
			@{
				name = 'table_14_name'
				type = 'textbox'
				label = 'Table 14 Name'
				description = ''
				disabled = '!table_13_name'
				hidden = '!table_13_name'
			}
			@{
				name = 'table_14_query'
				type = 'textbox'
				label = 'Table 14 Query'
				description = ''
				disabled = '!table_13_name'
				hidden = '!table_13_name'
			}

			@{
				name = 'table_15_header'
				type = 'text'
				text = 'Table 15'
				tooltip = 'Table 15 Config'
				disabled = '!table_14_name'
				hidden = '!table_14_name'
			}
			@{
				name = 'table_15_name'
				type = 'textbox'
				label = 'Table 15 Name'
				description = ''
				disabled = '!table_14_name'
				hidden = '!table_14_name'
			}
			@{
				name = 'table_15_query'
				type = 'textbox'
				label = 'Table 15 Query'
				description = ''
				disabled = '!table_14_name'
				hidden = '!table_14_name'
			}

			@{
				name = 'table_16_header'
				type = 'text'
				text = 'Table 16'
				tooltip = 'Table 16 Config'
				disabled = '!table_15_name'
				hidden = '!table_15_name'
			}
			@{
				name = 'table_16_name'
				type = 'textbox'
				label = 'Table 16 Name'
				description = ''
				disabled = '!table_15_name'
				hidden = '!table_15_name'
			}
			@{
				name = 'table_16_query'
				type = 'textbox'
				label = 'Table 16 Query'
				description = ''
				disabled = '!table_15_name'
				hidden = '!table_15_name'
			}

			@{
				name = 'table_17_header'
				type = 'text'
				text = 'Table 17'
				tooltip = 'Table 17 Config'
				disabled = '!table_16_name'
				hidden = '!table_16_name'
			}
			@{
				name = 'table_17_name'
				type = 'textbox'
				label = 'Table 17 Name'
				description = ''
				disabled = '!table_16_name'
				hidden = '!table_16_name'
				
			}
			@{
				name = 'table_17_query'
				type = 'textbox'
				label = 'Table 17 Query'
				description = ''
				disabled = '!table_16_name'
				hidden = '!table_16_name'
			}

			@{
				name = 'table_18_header'
				type = 'text'
				text = 'Table 18'
				tooltip = 'Table 18 Config'
				disabled = '!table_17_name'
				hidden = '!table_17_name'
			}
			@{
				name = 'table_18_name'
				type = 'textbox'
				label = 'Table 18 Name'
				description = ''
				disabled = '!table_17_name'
				hidden = '!table_17_name'
			}
			@{
				name = 'table_18_query'
				type = 'textbox'
				label = 'Table 18 Query'
				description = ''
				disabled = '!table_17_name'
				hidden = '!table_17_name'
			}

			@{
				name = 'table_19_header'
				type = 'text'
				text = 'Table 19'
				tooltip = 'Table 19 Config'
				disabled = '!table_18_name'
				hidden = '!table_18_name'
			}
			@{
				name = 'table_19_name'
				type = 'textbox'
				label = 'Table 19 Name'
				description = ''
				disabled = '!table_18_name'
				hidden = '!table_18_name'
			}
			@{
				name = 'table_19_query'
				type = 'textbox'
				label = 'Table 19 Query'
				description = ''
				disabled = '!table_18_name'
				hidden = '!table_18_name'
			}

			@{
				name = 'table_20_header'
				type = 'text'
				text = 'Table 20'
				tooltip = 'Table 20 Config'
				disabled = '!table_19_name'
				hidden = '!table_19_name'
			}
			@{
				name = 'table_20_name'
				type = 'textbox'
				label = 'Table 20 Name'
				description = ''
				disabled = '!table_19_name'
				hidden = '!table_19_name'
			}
			@{
				name = 'table_20_query'
				type = 'textbox'
				label = 'Table 20 Query'
				description = ''
				disabled = '!table_19_name'
				hidden = '!table_19_name'
			}

			
        )
    }

    if ($TestConnection) {
        Open-ProgressDBConnection $ConnectionParams
		$connection_params = ConvertFrom-Json2 $ConnectionParams
        
        $query = "SELECT TBL 'Name', 'Table' `"Type`"  FROM sysprogress.SYSTABLES_FULL WHERE TBLTYPE = 'T' ORDER BY TBL"
        $sql_command = New-ProgressDBCommand $Query $ConnectionParams
		$sql_command.CommandTimeout = $connection_params.query_timeout
        $result = (Invoke-ProgressDBCommand $sql_command)
    }

    if ($Configuration) {
        @()
    }

    Log info "Done"
}


function Idm-OnUnload {
    Close-ProgressDBConnection
}

#
# CRUD functions
#
$ColumnsInfoCache = @{}

function Idm-Dispatcher {
    param (
        # Optional Class/Operation
        [string] $Class,
        [string] $Operation,
        # Mode
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-Class='$Class' -Operation='$Operation' -GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"
    $connection_params = ConvertFrom-Json2 $SystemParams

    if ($Class -eq '') {

        if ($GetMeta) {
            #
            # Output list of supported operations per table/view (named Class)
            #
            for ($i = 0; $i -lt 21; $i++)
            {
                if($connection_params."table_$($i)_name".length -gt 0)
                {
                    @(
                        [ordered]@{
                            Class = $connection_params."table_$($i)_name"
                            Operation = 'Read'
                            'Source type' = 'Query'
                            'Primary key' = ''
                            'Supported operations' = 'R'
                            'Query' = $connection_params."table_$($i)_query"
                        }
                    )
                    }
            }

        }
        else {
            # Purposely no-operation.
        }

    }
    else {

        if ($GetMeta) {
           @() # No Configuration Options
        }
        else {
            #
            # Execute function
            #

            Open-ProgressDBConnection $SystemParams

            for ($i = 0; $i -lt 21; $i++)
            {
                if($connection_params."table_$($i)_name" -eq $class)
                {
                    $class_query = ($connection_params."table_$($i)_query" -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }) -join ' '
                    break
                }
            }
			
            $column_query = "SELECT TOP 1 * FROM ( $($class_query) ) columns"

            $columns = Fill-SqlInfoCache -Query $column_query

            $Global:ColumnsInfoCache[$Class] = @{
                primary_keys = @($columns | Where-Object { $_.is_primary_key } | ForEach-Object { $_.name })
                identity_col = @($columns | Where-Object { $_.is_identity    } | ForEach-Object { $_.name })[0]
            }

            $primary_keys = $Global:ColumnsInfoCache[$Class].primary_keys
            $identity_col = $Global:ColumnsInfoCache[$Class].identity_col

            $function_params = ConvertFrom-Json2 $FunctionParams

            # Replace $null by [System.DBNull]::Value
            $keys_with_null_value = @()
            foreach ($key in $function_params.Keys) { if ($function_params[$key] -eq $null) { $keys_with_null_value += $key } }
            foreach ($key in $keys_with_null_value) { $function_params[$key] = [System.DBNull]::Value }
            
            $sql_command = New-ProgressDBCommand $class_query $SystemParams
			
            Invoke-ProgressDBCommand $sql_command
            Dispose-ProgressDBCommand $sql_command
			
			Close-ProgressDBConnection
        }

    }

    Log info "Done"
}

#
# Helper functions
#
function Fill-SqlInfoCache {
    param (
        [switch] $Force,
        [string] $Query,
        [string] $Class
    )

    # Refresh cache
    $sql_command = New-ProgressDBCommand $Query
    $result = (Invoke-ProgressDBCommand $sql_command) | Get-Member -MemberType Properties | Select-Object Name
    
    Dispose-ProgressDBCommand $sql_command
	
    $objects = New-Object System.Collections.ArrayList
    $object = @{}
	
    # Process in one pass
    foreach ($row in $result) {
            $object = @{
                full_name = $Class
                type      = 'Query'
                columns   = New-Object System.Collections.ArrayList
            }

        $object.columns.Add(@{
            name           = $row.Name
            is_primary_key = $false
            is_identity    = $false
            is_computed    = $false
            is_nullable    = $true
        }) | Out-Null
    }

    if ($object.full_name -ne $null) {
        $objects.Add($object) | Out-Null
    }
    @($objects)
}

function New-ProgressDBCommand {
    param (
        [string] $CommandText,
		[string] $ConnectionParams
    )
	$connection_params = ConvertFrom-Json2 $ConnectionParams
    
	$sql_command = New-Object System.Data.Odbc.OdbcCommand($CommandText, $Global:ProgressDBConnection)
	$sql_command.CommandTimeout = $connection_params.query_timeout
    return $sql_command
}


function Dispose-ProgressDBCommand {
    param (
        [System.Data.Odbc.OdbcCommand] $SqlCommand
    )

    $SqlCommand.Dispose()
}

function Invoke-ProgressDBCommand {
    param (
        [System.Data.Odbc.OdbcCommand] $SqlCommand
    )

    function Invoke-ProgressDBCommand-ExecuteReader {
        param (
            [System.Data.Odbc.OdbcCommand] $SqlCommand
        )
        $data_reader = $SqlCommand.ExecuteReader()
        $column_names = @($data_reader.GetSchemaTable().ColumnName)

        if ($column_names) {

            $hash_table = [ordered]@{}

            foreach ($column_name in $column_names) {
                $hash_table[$column_name] = ""
            }

#           $obj = [PSCustomObject]$hash_table
            $obj = New-Object -TypeName PSObject -Property $hash_table

            # Read data
			if($data_reader.HasRows) {
				while ($data_reader.Read()) {
					foreach ($column_name in $column_names) {
						$obj.$column_name = if ($data_reader[$column_name] -is [System.DBNull]) { $null } else { $data_reader[$column_name] }
					}

					# Output data
					$obj
				}
			} else {
				Log debug "No rows returned"
				$obj
			}

        }

        $data_reader.Close()

    }

    try {
        Invoke-ProgressDBCommand-ExecuteReader $SqlCommand
    }
    catch {
        Log error "Failed: $_"
        Write-Error $_
    }

    Log debug "Done"

}

function Open-ProgressDBConnection {
    param (
        [string] $ConnectionParams
    )

    $connection_params = ConvertFrom-Json2 $ConnectionParams

    $connection_string =  "DRIVER={Progress OpenEdge $($connection_params.driver_version) driver};HOST=$($connection_params.host_name);PORT=$($connection_params.port);DB=$($connection_params.database);UID=$($connection_params.user);PWD=$($connection_params.password);DIL=$($connection_params.isolation_mode);AS=$($connection_params.array_size);"
    
	if($connection_params.enablePacketSize) { $connectionString += "Packet Size=512;" }
    if($connection_params.enableETWT) { $connectionString += "ETWT=1;" }
    if($connection_params.enableUWCT) { $connectionString += "UWCT=1;" }
    if($connection_params.enableKA) { $connectionString += "KA=1;" }
    
    if ($Global:ProgressDBConnection -and $connection_string -ne $Global:ProgressDBConnectionString) {
        Log info "ProgressDBConnection connection parameters changed"
        Close-ProgressDBConnection
    }

    if ($Global:ProgressDBConnection -and $Global:ProgressDBConnection.State -ne 'Open') {
        Log warn "ProgressDBConnection State is '$($Global:ProgressDBConnection.State)'"
        Close-ProgressDBConnection
    }

    Log info "Opening ProgressDBConnection"

    try {
        $connection = (new-object System.Data.Odbc.OdbcConnection);
        $connection.connectionstring = $connection_string
        $connection.ConnectionTimeout = $connection_params.connection_timeout
		$connection.open();

        $Global:ProgressDBConnection       = $connection
        $Global:ProgressDBConnectionString = $connection_string

        $Global:ColumnsInfoCache = @{}
    }
    catch {
        Log error "Failed: $_"
		Write-Error $_
    }

    Log info "Done"
    
}

function Close-ProgressDBConnection {
    if ($Global:ProgressDBConnection) {
        Log info "Closing ProgressDBConnection"

        try {
            $Global:ProgressDBConnection.Close()
            $Global:ProgressDBConnection = $null
        }
        catch {
            # Purposely ignoring errors
        }

        Log info "Done"
    }
}
