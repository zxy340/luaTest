info = debug.getinfo(1,'S');
file_path = (info.source);
file_path = string.gsub(file_path, "@","");
i, j = string.find(file_path, "\\.*%.lua")
file_path=string.gsub(file_path, "\\[%w_]-%.lua$","\\");
WriteToLog(file_path.."\n", "red")


tstring = os.date('%Y-%m-%d_%H;%M;%S', t0)
local socket1 = require"socket"
local t0 = socket1.gettime()
os.execute("mkdir \"" ..file_path.."\\".. tstring.."\"")
adc_data_path = file_path.."\\"..tstring.."\\adc_data.bin"
wireshark_cmd = "\"\"C:\\Program Files\\Wireshark\\tshark.exe\" -i \\Device\\NPF_{1AC9B645-3847-4E0C-A132-1B7BB8AAA047} -c 100 --time-stamp-type host_hiprec -t ad -w ".."\""..file_path.."\\"..tstring.."\\\\".."anchor\" -f \"udp and src host 192.168.33.180\"\""
io.popen(wireshark_cmd)
RSTD.Sleep(5000)
ar1.CaptureCardConfig_StartRecord(adc_data_path, 0)
RSTD.Sleep(1000)
ar1.StartFrame()
RSTD.Sleep(2000)