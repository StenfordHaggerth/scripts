local sampev = require'lib.samp.events'--------------luac + ���� + �����
local vr = false
local nik = 'name'
local list = {}
local bykvi = 0
local nameini = 'TheKingOfMutes.ini' --��� ini �����
if not doesDirectoryExist('moonloader/TheKingOfMutes') then createDirectory('moonloader/TheKingOfMutes') end
function firstSettings()
	local file = io.open('moonloader/TheKingOfMutes/' .. nameini, 'w')
	file:write(
			'[settings]' ..
	'\n' .. 'akt=TheKingOfMutes'..
	'\n' .. 'aktiv=TheKingOfMutes'..
	'\n' .. 'matvr=60'..
	'\n' .. 'matvrda=false'..
	'\n' .. 'log=true'..
	'\n' .. 'screen=false'..
	'\n' .. 'script=false'..
	'\n' .. 'colour=1'..
	'\n' .. 'matvrtitle=���'..
	'\n' .. 'caps=30'..
	'\n' .. 'capstitle=���� � ��� ���'..
	'\n' .. 'capsda=false'
	) --���������, ������� ������������ � ������ ���
	file:close()
end
if not doesFileExist('moonloader/TheKingOfMutes/' .. nameini) then firstSettings() end
local directIni = 'moonloader\\TheKingOfMutes\\' .. nameini
local imgui = require 'imgui'
local key = require 'vkeys'
local encoding = require 'encoding'
local inicfg   = require 'inicfg'

local colour = 'F08080'
local akt = imgui.ImBuffer(256)
local akt2 = imgui.ImBuffer(256)
local aktiv = imgui.ImBuffer(256)
local aktiv2 = imgui.ImBuffer(256)
local matvr = imgui.ImBuffer(256)
local matvr2 = imgui.ImBuffer(256)
local caps = imgui.ImBuffer(256)
local caps2 = imgui.ImBuffer(256)
local matvrtitle = imgui.ImBuffer(256)
local matvrtitle2 = imgui.ImBuffer(256)
local capstitle = imgui.ImBuffer(256)
local capstitle2 = imgui.ImBuffer(256)
local matvr_test = imgui.ImBool(false)
local matvr_test2 = imgui.ImBool(false)
local caps_test = imgui.ImBool(false)
local caps_test2 = imgui.ImBool(false)
local log_test = imgui.ImBool(false)
local log_test2 = imgui.ImBool(false)
local screen_test = imgui.ImBool(false)
local screen_test2 = imgui.ImBool(false)
local script_test = imgui.ImBool(false)
local script_test2 = imgui.ImBool(false)
local checked_radio = imgui.ImInt(1)
local bykv = {"�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�"}


encoding.default = 'CP1251' 
u8 = encoding.UTF8
local savetext = u8" "
local items = {
  u8"Ҹ���� ����",
  u8"����� ����",
  u8"������� ����",
  u8"������� ����",
  u8"������ ����",
  u8"��������� ����",
  u8"���������� ����",
  u8"Ҹ���-������� ����",
  u8"������� ����",
  u8"�����-������� ����"
}
local styles = {
  u8'�������',
  u8'������'
}
local function upper_count(s)
  local count = 0
  for c in string.gmatch(s, '[A-Z�-�]') do
      count = count + 1
  end
  return count
end
local function caps_coefficient(s, length)
    return upper_count(s) / length
end

local def = {
  settings = {
    theme = 3,
    style = 1,
    key = 0,
    reload = false,
  },
}
local main_window_state = imgui.ImBool(false)
local ini = inicfg.load(def, directIni)
combo_select = imgui.ImInt(ini.settings.colour)
akt = imgui.ImBuffer(tostring(ini.settings.akt), 256)
akt2.v = akt.v
aktiv = imgui.ImBuffer(tostring(ini.settings.aktiv), 256)
aktiv2.v = aktiv.v
matvr = imgui.ImBuffer(tostring(ini.settings.matvr), 256)--matvr_test
matvr2.v = matvr.v
caps = imgui.ImBuffer(tostring(ini.settings.caps), 256)--matvr_test
caps2.v = caps.v
matvrtitle = imgui.ImBuffer(tostring(ini.settings.matvrtitle), 256)--matvr_test
matvrtitle2.v = matvrtitle.v
capstitle = imgui.ImBuffer(tostring(ini.settings.capstitle), 256)--matvr_test
capstitle2.v = capstitle.v
caps_test = imgui.ImBool(ini.settings.capsda)
caps_test2.v = caps_test.v

script_test = imgui.ImBool(ini.settings.script)
script_test2.v = script_test.v
log_test = imgui.ImBool(ini.settings.log)
log_test2.v = log_test.v
screen_test = imgui.ImBool(ini.settings.screen)
screen_test2.v = screen_test.v

local tema = imgui.ImInt(ini.settings.theme)
local style = imgui.ImInt(ini.settings.style)
local colour = imgui.ImInt(ini.settings.colour)
function imgui.OnDrawFrame()
	if ini.settings.style == 0 then strong_style() end
	if ini.settings.style == 1 then easy_style() end
	if ini.settings.theme == 0 then theme1() end
	if ini.settings.theme == 1 then theme2() end
	if ini.settings.theme == 2 then theme3() end
	if ini.settings.theme == 3 then theme4() end
	if ini.settings.theme == 4 then theme5() end
	if ini.settings.theme == 5 then theme6() end
	if ini.settings.theme == 6 then theme7() end	
	if ini.settings.theme == 7 then theme8() end
	if ini.settings.theme == 8 then theme9() end
	if ini.settings.theme == 9 then theme10() end
	if main_window_state.v then
		local xPos, yPos = getScreenResolution() 
		local sameline = 230 
		imgui.SetNextWindowPos(imgui.ImVec2(xPos-400, yPos-300), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5)) 
		imgui.SetNextWindowSize(imgui.ImVec2(600, 370), 1) 	
		imgui.Begin(u8'TheKingOfMutes by Stenford_Stealer', main_window_state, imgui.WindowFlags.NoResize or imgui.WindowFlags.NoCollapse or imgui.WindowFlags.NoSavedSettings)
		imgui.BeginChild('left', imgui.ImVec2(123, 0), true) 
		if imgui.Selectable(u8"��� � /vr", menu == 1) then menu = 1 end 
		if imgui.Selectable(u8"����", menu == 2) then menu = 2 end
		if imgui.Selectable(u8"���������", menu == 3) then menu = 3 end
		if imgui.Selectable(u8"������", menu == 4) then menu = 4 end 
			
		--if imgui.Selectable(u8"��� ����������", menu == 4) then menu = 4 end 
		--if imgui.Selectable(u8"���������", menu == 5) then menu = 5 end 
		--if imgui.Selectable(u8"����� � �������", menu == 6) then menu = 6 end 
		imgui.EndChild()
		imgui.SameLine()

		imgui.BeginChild('right', imgui.ImVec2(0, 0), true) 
		if menu == 1 then 
			imgui.PushItemWidth(60)
			if imgui.InputText(u8"�� ������� ����� �� ��� /vr?", matvr) then 
				--ini.settings.delayvr = delayvr.v
				--inicfg.save(def, directIni) end
				if matvr2.v == matvr.v then else
				ini.settings.matvr = matvr.v
				if inicfg.save(def, directIni) then
					matvr2.v = matvr.v
					--sampAddChatMessage("���������", -1)
				end
			end
			end
			if imgui.InputText(u8"������� ���� �� ��� /vr?", matvrtitle) then 
				--ini.settings.delayvr = delayvr.v
				--inicfg.save(def, directIni) end
				if matvrtitle2.v == matvrtitle.v then else
				ini.settings.matvrtitle = matvrtitle.v
				if inicfg.save(def, directIni) then
					matvrtitle2.v = matvrtitle.v
					--sampAddChatMessage("���������", -1)
				end
			end
			end
			imgui.SameLine()
			
			if imgui.Checkbox(u8"����� �� ��� /vr?", matvr_test)then	--1
				if matvr_test.v then
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}��� �� ��� � /vr {00ff38}�������", 0x8A5EB6)
					
				else
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}��� �� ��� � /vr {ee0b0b}��������", 0x8A5EB6)
					
				end
				
			end --1 
		elseif menu == 3 then   
		
			
		

			if imgui.InputText(u8"��������� ���-�����",akt) then
			
				if akt2.v == akt.v then else
				ini.settings.akt = akt.v
				if inicfg.save(def, directIni) then
					akt2.v = akt.v
					--sampAddChatMessage("���������", -1)
				end
			end
					
			end
			
			
			if imgui.InputText(u8"��������� ��������",aktiv) then
			
				if aktiv2.v == aktiv.v then else
				ini.settings.aktiv = aktiv.v
				if inicfg.save(def, directIni) then
					aktiv2.v = aktiv.v
					--sampAddChatMessage("���������", -1)
				end
			end
					
			end
						imgui.NewLine()---------
							imgui.Separator()-------
		if imgui.Checkbox(u8"��������� ������ �� �������?", log_test)then	--1
				if log_test.v then
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}������ � ���������� {00ff38}����� �����������", 0x8A5EB6)
					ini.settings.log = true
					inicfg.save(def, directIni)	
				else
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}������ � ���������� {ee0b0b}�� ����� �����������", 0x8A5EB6)
						ini.settings.log = false
					inicfg.save(def, directIni)	
				end
				
			end --1 
			if imgui.Checkbox(u8"��������� �������� ���������?", screen_test)then	--1
				if screen_test.v then
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}�������� � ���������� {00ff38}����� �����������", 0x8A5EB6)
					ini.settings.screen = true
					inicfg.save(def, directIni)		
				else
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}�������� � ���������� {ee0b0b}�� ����� �����������", 0x8A5EB6)
						ini.settings.screen = false
					inicfg.save(def, directIni)	
				end
				
			end --1 
		imgui.NewLine()---------
							imgui.Separator()-------
								if imgui.Checkbox(u8"������ � �������� ������?", script_test)then	--1
				if script_test.v then
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}������ {00ff38}�������� � �������� ������", 0x8A5EB6)
					ini.settings.script = true
					inicfg.save(def, directIni)		
				else
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}������ {ee0b0b}�� �������� � �������� ������", 0x8A5EB6)
						ini.settings.script = false
					inicfg.save(def, directIni)	
				end
					
				
			end --1
			imgui.NewLine()---------
							imgui.Separator()-------
				imgui.Text(u8"����� �������: ")
			imgui.SameLine()
			imgui.RadioButton(u8"���������", checked_radio, 1)
			imgui.SameLine()
			imgui.RadioButton(u8"�������", checked_radio, 2)
				--local asdqwdwqd= colour3.."���� ��������"
			
			 local textred = '{FF0000}���� �������a �������'
			 local textorange = '{FF8C00}���� �������a ���������'
			 local textyelow = '{FFFF00}���� �������a ������'
		     local textgreen = '{008000}���� �������a �������'
			 local textbluelight = '{ADD8E6}���� �������a �������' 
			 local textblue = '{0000FF}���� �������a �����'
			 local textpurple = '{9932CC}���� �������a ����������'
				if combo_select.v == 0 then imgui.TextColoredRGB((textred)) end
			if combo_select.v == 1 then imgui.TextColoredRGB((textorange)) end
			if combo_select.v == 2 then imgui.TextColoredRGB((textyelow)) end
			if combo_select.v == 3 then imgui.TextColoredRGB((textgreen)) end
			if combo_select.v == 4 then imgui.TextColoredRGB((textbluelight)) end
			if combo_select.v == 5 then imgui.TextColoredRGB((textblue)) end
	if combo_select.v == 6 then imgui.TextColoredRGB((textpurple)) end
		if imgui.Combo(u8'���� ��������', combo_select, u8"�������\0���������\0������\0�������\0�������\0�����\0����������\0\0")then
			 ini.settings.colour = combo_select.v
					inicfg.save(def, directIni)
			end 
	
                   
	--if	imgui.InputText(u8"���������� /famuninvite ",u)then
		
		--if u2.v == u.v then else
		--		ini.settings.uninvite = u.v
		--		if inicfg.save(def, directIni) then
		--			u2.v = u.v
		--			--sampAddChatMessage("���������", -1)
		--		end
		--	end
		
		--end
		elseif menu == 2 then
			 
			--imgui.SameLine(100)
				imgui.PushItemWidth(60)
			if imgui.InputText(u8"�� ������� ����� �� ����?", caps) then 
				--ini.settings.delayvr = delayvr.v
				--inicfg.save(def, directIni) end
				if caps2.v == caps.v then else
				ini.settings.caps = caps.v
				if inicfg.save(def, directIni) then
					caps2.v = caps.v
					--sampAddChatMessage("���������", -1)
				end
			end
			end
			imgui.PushItemWidth(300)
			if imgui.InputText(u8"������� ���� �� ����?", capstitle) then 
				--ini.settings.delayvr = delayvr.v
				--inicfg.save(def, directIni) end
				if capstitle2.v == capstitle.v then else
				ini.settings.capstitle = capstitle.v
				if inicfg.save(def, directIni) then
					capstitle2.v = capstitle.v
					--sampAddChatMessage("���������", -1)
				end
			end
			end
			imgui.SameLine()
			imgui.NewLine()
			if imgui.Checkbox(u8"����� �� ����?", caps_test)then	--1
				if caps_test.v then
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}��� �� ���� {00ff38}�������", 0x8A5EB6)
					
				else
					sampAddChatMessage("[TheKingOfMutes] {FFFFFF}��� �� ���� {ee0b0b}��������", 0x8A5EB6)
					
				end
				
			end --1 
		elseif menu == 4 then
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100)
			imgui.Text(u8'���������')
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(20) imgui.Text(u8'����� ����:   ') imgui.SameLine()
			imgui.PushItemWidth(130)
			if imgui.Combo('', tema, items, -1)then
				ini.settings.theme = tema.v
				inicfg.save(def, directIni)
			end 
			imgui.PopItemWidth()
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(20) imgui.Text(u8'����� �����:  ') imgui.SameLine()
			imgui.PushItemWidth(80)
			if imgui.Combo('##style', style, styles)then
				ini.settings.style = style.v
				inicfg.save(def, directIni)
			end 
			imgui.PopItemWidth()
			imgui.NewLine() imgui.NewLine() imgui.SameLine(360)
			imgui.NewLine() imgui.NewLine()
			imgui.NewLine() imgui.NewLine()
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(120)
			if imgui.Button(u8'���������', imgui.ImVec2(100, 25)) then 
				ini.settings.reload = true
				inicfg.save(def, directIni)
			end
		elseif menu == 4 then
			
		elseif menu == 5 then
			-- code
		elseif menu == 6 then
			imgui.Text(u8"����� ������� Stenford_Stealer")
			if imgui.Button(u8'VK', imgui.ImVec2(100, 25)) then 
				os.execute(('explorer.exe "%s"'):format("https://vk.com/razrab228"))
			end
		end
		
		imgui.EndChild()
		imgui.End()
	end
end


function main()
 
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
				sampAddChatMessage(string.format("[TheKingOfMutes]: {FFFFFF} ������� ��������!"), 0x8A5EB6 )
				print (aktiv.v)
					print (aktiv.v)
						print (aktiv.v)
							print (aktiv.v)
								print (aktiv.v)
									print (aktiv.v)
										print (aktiv.v)
	   sampRegisterChatCommand(aktiv.v, cmd_ssd)
	

		
	
	 if hasRename() then
        thisScript():unload()
    end
	if ini.settings.matvrda == true then
		matvr_test = imgui.ImBool(true)
	end
		if ini.settings.log == true then
		log_test = imgui.ImBool(true)
	end
		if ini.settings.screen == true then
		screen_test = imgui.ImBool(true)
	end
		if ini.settings.script == true then
		script_test = imgui.ImBool(true)
	end

	
	 while true do
    wait(0)
		imgui.Process = main_window_state.v
		if testCheat(akt.v) then 
			main_window_state.v = not main_window_state.v 
		end
	
	
	  end
	
	
	end
	--[23:40:30] {F345FC}[PREMIUM] {FFFFFF}Seth_Brooks[517]: ���� �� �� ����....
	--[23:40:34] {6495ED}[VIP] {FFFFFF}Markus_Shooter[62]: ���� �� ����
	
	function cmd_vrm()
	
	vr = not vr
	if vr == true then sampAddChatMessage("������ ����� �������",0x58E000) end  ---
	if	vr == false then sampAddChatMessage("������ ����� ��������",0xFF0000) end
	end
	
	function sampev.onServerMessage(color, msg)------
	
	--if (caps_test.v) then
	--print (msg) --(( Guccio_Gucci[338]: {B7AFAF}����{FFFFFF} ))
	--if msg:match("(.*)%[(%d+)%]: (.*)") then 
 --nick, id, message = msg:match("(.*)%[(%d+)%]: (.*)") 
--	print(" || ���: " .. nick .. " || ��: " ..tostring(id)..  " || C��������: "..message,-1) end
	--print ('smsc = '..message)
	--if message:match('(%U)(%U)(%U)(%U)') then
	--sampAddChatMessage('caps',-1)
	--end
	--end------------------------------------------------------------------------------------------------------------------------------------
	    if caps_test.v then--Angel_Hilo[788] �������:{B7AFAF} ����
		
		 if msg:find("(%S+)%[(%d+)]: (.+) ") then
		    local nick, id, sms = msg:match("(%S+)%[(%d+)]: (.+) ")
			
        local fool = "���: " .. nick .. " || ��: " ..id.." || C��������: "..sms
		
       local length = string.len(sms)
    if caps_coefficient(sms, length) > 0.75 and length > 1 then
	print (capstitle.v)
    if checked_radio.v == 1 then sampAddChatMessage ('/mute '..id..' '..caps.v..' '..u8(capstitle.v),-1) end
	if combo_select.v == 0 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xFF00FF) 
		sampAddChatMessage ("{FF0000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 1 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xFF8C00) 
		sampAddChatMessage ("{FF8C00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 2 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xFFFF00) 
		sampAddChatMessage ("{FFFF00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 3 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0x008000) 
		sampAddChatMessage ("{008000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 4 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xADD8E6) 
		sampAddChatMessage ("{ADD8E6}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 5 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0x0000FF) 
		sampAddChatMessage ("{0000FF}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 6 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0x9932CC) 
		sampAddChatMessage ("{9932CC}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if log_test.v then 		
		file = io.open(getGameDirectory().."//moonloader//TheKingOfMutes//chatlog.txt", "a")
file:write(msg..'\n') --����� ������ ����� ���������� ����
file:close()
end
     if screen_test.v then makeScreenshot()
	 end
    else
      
    end
	end
	
	 if msg:find("(%S+)%[(%d+)] �������:{B7AFAF} (.+)") then
		    local nick, id, sms = msg:match("(%S+)%[(%d+)] �������:{B7AFAF} (.+)")
	
	  local fool = "���: " .. nick .. " || ��: " ..id.." || C��������: "..sms
		
       local length = string.len(sms)
    if caps_coefficient(sms, length) > 0.75 and length > 1 then
       if checked_radio.v == 1 then sampAddChatMessage ('/mute '..id..' '..caps.v..' '..u8(capstitle.v),-1) end
	if combo_select.v == 0 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xFF0000) 
		sampAddChatMessage ("{FF0000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 1 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xFF8C00) 
		sampAddChatMessage ("{FF8C00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 2 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xFFFF00) 
		sampAddChatMessage ("{FFFF00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 3 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0x008000) 
		sampAddChatMessage ("{008000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 4 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0xADD8E6) 
		sampAddChatMessage ("{ADD8E6}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 5 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0x0000FF) 
		sampAddChatMessage ("{0000FF}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 6 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ������!',0x9932CC) 
		sampAddChatMessage ("{9932CC}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if log_test.v then 		
		file = io.open(getGameDirectory().."//moonloader//TheKingOfMutes//chatlog.txt", "a")
file:write(msg..'\n') --����� ������ ����� ���������� ����
file:close()
end
     if screen_test.v then makeScreenshot()
	 end
    else
      
    end
	end
	
	
    end
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if (matvr_test.v)and not(script_test.v) then
    if msg:find("{%S+}%[(%S+)] {FFFFFF}(%S+)%[(%d+)]: (.+) ") then
        local vip, nick, id, sms = msg:match("{%S+}%[(%S+)] {FFFFFF}(%S+)%[(%d+)]: (.+) ")
        local fool = "���: "..vip.." || ���: " .. nick .. " || ��: " .. id.. " || C��������: "..sms
   --     sampAddChatMessage(fool, -1)
		 if (sms:find("���"))or(sms:find("���"))or(sms:find("����"))or(sms:find("����"))or(sms:find("�����")) or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�������"))or(sms:find("�������"))or(sms:find("���"))or(sms:find("���"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("������"))or(sms:find("������"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�������"))or(sms:find("�������"))or(sms:find("�������"))or(sms:find("�������"))or(sms:find("�������"))or(sms:find("�������"))or(sms:find("�����"))or(sms:find("�����"))or(sms:find("�������"))or(sms:find("�������"))or(sms:find("�����"))or(sms:find("�����"))then
		if checked_radio.v == 1 then sampAddChatMessage ('/mute '..id..' '..matvr.v..' '..matvrtitle.v,-1) end
		
		
	if combo_select.v == 0 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xFF0000) 
		sampAddChatMessage ("{FF0000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 1 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xFF8C00) 
		sampAddChatMessage ("{FF8C00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 2 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xFFFF00) 
		sampAddChatMessage ("{FFFF00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 3 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0x008000) 
		sampAddChatMessage ("{008000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 4 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xADD8E6) 
		sampAddChatMessage ("{ADD8E6}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 5 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0x0000FF) 
		sampAddChatMessage ("{0000FF}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 6 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0x9932CC) 
		sampAddChatMessage ("{9932CC}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		
if log_test.v then 		
		file = io.open(getGameDirectory().."//moonloader//TheKingOfMutes//chatlog.txt", "a")
file:write(msg..'\n') --����� ������ ����� ���������� ����
file:close()
end
     if screen_test.v then makeScreenshot()
	 end
    end
    end
end

  if (matvr_test.v)and(script_test.v) then
    if msg:find("{%S+}%[(%S+)] {FFFFFF}(%S+)%[(%d+)]: (.+) ") then
        local vip, nick, id, sms = msg:match("{%S+}%[(%S+)] {FFFFFF}(%S+)%[(%d+)]: (.+) ")
        local fool = "���: "..vip.." || ���: " .. nick .. " || ��: " .. id.. " || C��������: "..sms
   --     sampAddChatMessage(fool, -1)
		 if (sms:find("������"))or(sms:find("������"))or(sms:find("�����"))or(sms:find("�����"))then
		 if checked_radio.v == 1 then sampAddChatMessage ('/mute '..id..' '..matvr.v..' '..matvrtitle.v,-1) end
		if combo_select.v == 0 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xFF0000) 
		sampAddChatMessage ("{FF0000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 1 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xFF8C00) 
		sampAddChatMessage ("{FF8C00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 2 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xFFFF00) 
		sampAddChatMessage ("{FFFF00}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 3 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0x008000) 
		sampAddChatMessage ("{008000}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 4 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0xADD8E6) 
		sampAddChatMessage ("{ADD8E6}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 5 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0x0000FF) 
		sampAddChatMessage ("{0000FF}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
		if combo_select.v == 6 then 
if checked_radio.v == 2 then sampAddChatMessage ('��������! ����� '..nick..'['..id..'] ���������� ��� � /vr!',0x9932CC) 
		sampAddChatMessage ("{9932CC}��������� ������: {FFFFFF}"..msg,-1) 
	end
		end
if log_test.v then 		
		file = io.open(getGameDirectory().."//moonloader//TheKingOfMutes//chatlog.txt", "a")
file:write(msg..'\n') --����� ������ ����� ���������� ����
file:close()
end
     if screen_test.v then makeScreenshot()end
    end
    end
end

	end
	 

	function makeScreenshot(disable) -- ���� �������� true, ��������� � ��� ����� ������
    if disable then displayHud(false) sampSetChatDisplayMode(0) end
    require('memory').setuint8(sampGetBase() + 0x119CBC, 1)
    if disable then displayHud(true) sampSetChatDisplayMode(2) end
end

function easy_style()
  imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowPadding = imgui.ImVec2(9, 5)
    style.WindowRounding = 10
    style.ChildWindowRounding = 10
    style.FramePadding = imgui.ImVec2(5, 2)
    style.FrameRounding = 6.0
    style.ItemSpacing = imgui.ImVec2(9.0, 3.0)
    style.ItemInnerSpacing = imgui.ImVec2(5.0, 3.0)
    style.IndentSpacing = 21
    style.ScrollbarSize = 6.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 17.0
    style.GrabRounding = 16.0

    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
end

function strong_style()
  imgui.SwitchContext()
    local style = imgui.GetStyle()

    style.WindowPadding = imgui.ImVec2(5, 4)
    style.WindowRounding = 2
    style.ChildWindowRounding = 2
    style.FramePadding = imgui.ImVec2(4, 3)
    style.FrameRounding = 2
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 13
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8
    style.GrabRounding = 1

    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
end

function theme1()
  local style = imgui.GetStyle()
  local Colors = style.Colors
    local ImVec4 = imgui.ImVec4
        Colors[imgui.Col.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
        Colors[imgui.Col.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
        Colors[imgui.Col.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
        Colors[imgui.Col.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
        Colors[imgui.Col.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
        Colors[imgui.Col.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
        Colors[imgui.Col.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
        Colors[imgui.Col.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
        Colors[imgui.Col.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
        Colors[imgui.Col.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
        Colors[imgui.Col.TitleBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
        Colors[imgui.Col.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
        Colors[imgui.Col.TitleBgActive] = ImVec4(0.07, 0.07, 0.09, 1.00)
        Colors[imgui.Col.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
        Colors[imgui.Col.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
        Colors[imgui.Col.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
        Colors[imgui.Col.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
        Colors[imgui.Col.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
        Colors[imgui.Col.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
        Colors[imgui.Col.CheckMark] = ImVec4(0.80, 0.80, 0.83, 0.31)
        Colors[imgui.Col.SliderGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
        Colors[imgui.Col.SliderGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
        Colors[imgui.Col.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
        Colors[imgui.Col.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
        Colors[imgui.Col.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
        Colors[imgui.Col.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
        Colors[imgui.Col.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
        Colors[imgui.Col.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
        Colors[imgui.Col.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
        Colors[imgui.Col.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
        Colors[imgui.Col.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
        Colors[imgui.Col.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
        Colors[imgui.Col.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
        Colors[imgui.Col.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
        Colors[imgui.Col.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
        Colors[imgui.Col.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
        Colors[imgui.Col.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
        Colors[imgui.Col.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
        Colors[imgui.Col.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
        Colors[imgui.Col.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end

function theme2()
  local style = imgui.GetStyle()
  local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function theme3()
  local style = imgui.GetStyle()
  local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    colors[clr.FrameBg]                = ImVec4(0.48, 0.16, 0.16, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.48, 0.16, 0.16, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.88, 0.26, 0.24, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Button]                 = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.98, 0.06, 0.06, 1.00)
    colors[clr.Header]                 = ImVec4(0.98, 0.26, 0.26, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.98, 0.26, 0.26, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.10, 0.10, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.75, 0.10, 0.10, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.98, 0.26, 0.26, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.26, 0.26, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.26, 0.26, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function theme4()
  local style = imgui.GetStyle()
  local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    colors[clr.FrameBg]                = ImVec4(0.16, 0.48, 0.42, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.48, 0.42, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.88, 0.77, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.98, 0.82, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.98, 0.85, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.98, 0.85, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.10, 0.75, 0.63, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.10, 0.75, 0.63, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.98, 0.85, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.98, 0.85, 0.95)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.81, 0.35, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.98, 0.85, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function theme5()
  local style = imgui.GetStyle()
  local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
  style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
  style.Alpha = 1.0
  style.Colors[clr.Text] = ImVec4(1.000, 1.000, 1.000, 1.000)
  style.Colors[clr.TextDisabled] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.WindowBg] = ImVec4(0.000, 0.000, 0.000, 0.895)
  style.Colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
  style.Colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
  style.Colors[clr.Border] = ImVec4(0.184, 0.878, 0.000, 0.500)
  style.Colors[clr.BorderShadow] = ImVec4(1.00, 1.00, 1.00, 0.10)
  style.Colors[clr.TitleBg] = ImVec4(0.026, 0.597, 0.000, 1.000)
  style.Colors[clr.TitleBgCollapsed] = ImVec4(0.099, 0.315, 0.000, 0.000)
  style.Colors[clr.TitleBgActive] = ImVec4(0.026, 0.597, 0.000, 1.000)
  --style.Colors[clr.MenuBarBg] = ImVec4(0.86, 0.86, 0.86, 1.00)
  colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
  style.Colors[clr.ScrollbarBg] = ImVec4(0.000, 0.000, 0.000, 0.801)
  style.Colors[clr.ScrollbarGrab] = ImVec4(0.238, 0.238, 0.238, 1.000)
  style.Colors[clr.ScrollbarGrabHovered] = ImVec4(0.238, 0.238, 0.238, 1.000)
  style.Colors[clr.ScrollbarGrabActive] = ImVec4(0.004, 0.381, 0.000, 1.000)
  style.Colors[clr.CheckMark] = ImVec4(0.009, 0.845, 0.000, 1.000)
  style.Colors[clr.SliderGrab] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.SliderGrabActive] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.Button] = ImVec4(0.000, 0.000, 0.000, 0.400)
  style.Colors[clr.ButtonHovered] = ImVec4(0.000, 0.619, 0.014, 1.000)
  style.Colors[clr.ButtonActive] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.Header] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.HeaderHovered] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.HeaderActive] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.ResizeGrip] = ImVec4(0.000, 1.000, 0.221, 0.597)
  style.Colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
  style.Colors[clr.ResizeGripActive] = ImVec4(0.26, 0.59, 0.98, 0.95)
  style.Colors[clr.PlotLines] = ImVec4(0.39, 0.39, 0.39, 1.00)
  style.Colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
  style.Colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
  style.Colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
  style.Colors[clr.TextSelectedBg] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.ModalWindowDarkening] = ImVec4(0.20, 0.20, 0.20, 0.35)

  style.ScrollbarSize = 16.0
  style.GrabMinSize = 8.0
  style.WindowRounding = 0.0

  style.AntiAliasedLines = true
end

function theme6()
  local style = imgui.GetStyle()
  local colors = style.Colors
  local clr = imgui.Col
  local ImVec4 = imgui.ImVec4
  colors[clr.Text] = ImVec4(0.90, 0.90, 0.90, 1.00)
  colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
  colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
  colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
  colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
  colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
  colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
  colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
  colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
  colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
  colors[clr.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
  colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
  colors[clr.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
  colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
  colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
  colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
  colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
  colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
  colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
  colors[clr.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
  colors[clr.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
  colors[clr.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
  colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
  colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
  colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
  colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
  colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
  colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
  colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
  colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
  colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
  colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
  colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
  colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
  colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
  colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
  colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
  colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
  colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end

function theme7()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
	colors[clr.WindowBg]              = ImVec4(0.14, 0.12, 0.16, 1.00);
    colors[clr.ChildWindowBg]         = ImVec4(0.30, 0.20, 0.39, 0.00);
    colors[clr.PopupBg]               = ImVec4(0.05, 0.05, 0.10, 0.90);
    colors[clr.Border]                = ImVec4(0.89, 0.85, 0.92, 0.30);
    colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00);
    colors[clr.FrameBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.FrameBgHovered]        = ImVec4(0.41, 0.19, 0.63, 0.68);
    colors[clr.FrameBgActive]         = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TitleBg]               = ImVec4(0.41, 0.19, 0.63, 0.45);
    colors[clr.TitleBgCollapsed]      = ImVec4(0.41, 0.19, 0.63, 0.35);
    colors[clr.TitleBgActive]         = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.MenuBarBg]             = ImVec4(0.30, 0.20, 0.39, 0.57);
    colors[clr.ScrollbarBg]           = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.ScrollbarGrab]         = ImVec4(0.41, 0.19, 0.63, 0.31);
    colors[clr.ScrollbarGrabHovered]  = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ScrollbarGrabActive]   = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ComboBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.CheckMark]             = ImVec4(0.56, 0.61, 1.00, 1.00);
    colors[clr.SliderGrab]            = ImVec4(0.41, 0.19, 0.63, 0.24);
    colors[clr.SliderGrabActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.Button]                = ImVec4(0.41, 0.19, 0.63, 0.44);
    colors[clr.ButtonHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.ButtonActive]          = ImVec4(0.64, 0.33, 0.94, 1.00);
    colors[clr.Header]                = ImVec4(0.41, 0.19, 0.63, 0.76);
    colors[clr.HeaderHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.HeaderActive]          = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ResizeGrip]            = ImVec4(0.41, 0.19, 0.63, 0.20);
    colors[clr.ResizeGripHovered]     = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ResizeGripActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.CloseButton]           = ImVec4(1.00, 1.00, 1.00, 0.75);
    colors[clr.CloseButtonHovered]    = ImVec4(0.88, 0.74, 1.00, 0.59);
    colors[clr.CloseButtonActive]     = ImVec4(0.88, 0.85, 0.92, 1.00);
    colors[clr.PlotLines]             = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotLinesHovered]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.PlotHistogram]         = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotHistogramHovered]  = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TextSelectedBg]        = ImVec4(0.41, 0.19, 0.63, 0.43);
    colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35);
end

function theme8()
  local style = imgui.GetStyle()
  local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
    colors[clr.TextDisabled]           = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.ChildWindowBg]          = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.PopupBg]                = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.Border]                 = ImVec4(0.82, 0.77, 0.78, 1.00)
    colors[clr.BorderShadow]           = ImVec4(0.35, 0.35, 0.35, 0.66)
    colors[clr.FrameBg]                = ImVec4(1.00, 1.00, 1.00, 0.28)
    colors[clr.FrameBgHovered]         = ImVec4(0.68, 0.68, 0.68, 0.67)
    colors[clr.FrameBgActive]          = ImVec4(0.79, 0.73, 0.73, 0.62)
    colors[clr.TitleBg]                = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.46, 0.46, 0.46, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.MenuBarBg]              = ImVec4(0.00, 0.00, 0.00, 0.80)
    colors[clr.ScrollbarBg]            = ImVec4(0.00, 0.00, 0.00, 0.60)
    colors[clr.ScrollbarGrab]          = ImVec4(1.00, 1.00, 1.00, 0.87)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(1.00, 1.00, 1.00, 0.79)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.80, 0.50, 0.50, 0.40)
    colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 0.99)
    colors[clr.CheckMark]              = ImVec4(0.99, 0.99, 0.99, 0.52)
    colors[clr.SliderGrab]             = ImVec4(1.00, 1.00, 1.00, 0.42)
    colors[clr.SliderGrabActive]       = ImVec4(0.76, 0.76, 0.76, 1.00)
    colors[clr.Button]                 = ImVec4(0.51, 0.51, 0.51, 0.60)
    colors[clr.ButtonHovered]          = ImVec4(0.68, 0.68, 0.68, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.67, 0.67, 0.67, 1.00)
    colors[clr.Header]                 = ImVec4(0.72, 0.72, 0.72, 0.54)
    colors[clr.HeaderHovered]          = ImVec4(0.92, 0.92, 0.95, 0.77)
    colors[clr.HeaderActive]           = ImVec4(0.82, 0.82, 0.82, 0.80)
    colors[clr.Separator]              = ImVec4(0.73, 0.73, 0.73, 1.00)
    colors[clr.SeparatorHovered]       = ImVec4(0.81, 0.81, 0.81, 1.00)
    colors[clr.SeparatorActive]        = ImVec4(0.74, 0.74, 0.74, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.80, 0.80, 0.80, 0.30)
    colors[clr.ResizeGripHovered]      = ImVec4(0.95, 0.95, 0.95, 0.60)
    colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 0.90)
    colors[clr.CloseButton]            = ImVec4(0.45, 0.45, 0.45, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.70, 0.70, 0.90, 0.60)
    colors[clr.CloseButtonActive]      = ImVec4(0.70, 0.70, 0.70, 1.00)
    colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(1.00, 1.00, 1.00, 0.35)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.88, 0.88, 0.88, 0.35)
end

function theme9()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.00, 0.00, 0.00, 0.93)
    colors[clr.ChildWindowBg]          = ImVec4(0.00, 0.00, 0.00, 0.80)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.09, 0.94)
    colors[clr.Border]                 = ImVec4(0.97, 1.00, 0.00, 0.65)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(1.00, 0.96, 0.00, 0.68)
    colors[clr.FrameBgHovered]         = ImVec4(0.79, 0.93, 0.04, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.96, 0.83, 0.04, 0.45)
    colors[clr.TitleBg]                = ImVec4(0.80, 0.80, 0.12, 0.87)
    colors[clr.TitleBgActive]          = ImVec4(0.95, 0.72, 0.00, 0.87)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.88, 0.90, 0.08, 0.20)
    colors[clr.MenuBarBg]              = ImVec4(0.85, 0.97, 0.04, 0.80)
    colors[clr.ScrollbarBg]            = ImVec4(0.90, 0.67, 0.05, 0.60)
    colors[clr.ScrollbarGrab]          = ImVec4(0.82, 0.87, 0.10, 0.88)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.86, 0.81, 0.13, 0.40)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.92, 0.86, 0.07, 0.40)
    colors[clr.ComboBg]                = ImVec4(0.76, 0.63, 0.03, 0.99)
    colors[clr.CheckMark]              = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.SliderGrab]             = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.Button]                 = ImVec4(0.97, 1.00, 0.00, 0.66)
    colors[clr.ButtonHovered]          = ImVec4(0.85, 0.90, 0.02, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.92, 0.74, 0.04, 1.00)
    colors[clr.Header]                 = ImVec4(0.80, 0.94, 0.04, 0.45)
    colors[clr.HeaderHovered]          = ImVec4(0.90, 0.79, 0.13, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.87, 0.86, 0.05, 0.80)
    colors[clr.Separator]              = ImVec4(0.91, 0.82, 0.06, 1.00)
    colors[clr.SeparatorHovered]       = ImVec4(0.96, 0.90, 0.08, 1.00)
    colors[clr.SeparatorActive]        = ImVec4(0.97, 0.91, 0.04, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(1.00, 1.00, 1.00, 0.30)
    colors[clr.ResizeGripHovered]      = ImVec4(1.00, 1.00, 1.00, 0.60)
    colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 0.90)
    colors[clr.CloseButton]            = ImVec4(0.84, 0.90, 0.50, 0.57)
    colors[clr.CloseButtonHovered]     = ImVec4(0.90, 0.89, 0.70, 0.60)
    colors[clr.CloseButtonActive]      = ImVec4(0.70, 0.70, 0.70, 1.00)
    colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.02, 1.00, 0.35)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35)
end

function theme10()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.ChildWindowBg]          = ImVec4(0.10, 0.10, 0.10, 1.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.Border]                 = ImVec4(0.70, 0.70, 0.70, 0.40)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.15, 0.15, 0.15, 1.00)
    colors[clr.FrameBgHovered]         = ImVec4(0.19, 0.19, 0.19, 0.71)
    colors[clr.FrameBgActive]          = ImVec4(0.34, 0.34, 0.34, 0.79)
    colors[clr.TitleBg]                = ImVec4(0.00, 0.69, 0.33, 0.80)
    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.69, 0.33, 0.50)
    colors[clr.MenuBarBg]              = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.16, 0.16, 0.16, 1.00)
    colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 1.00, 0.48, 1.00)
    colors[clr.ComboBg]                = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.77, 0.37, 1.00)
    colors[clr.Button]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ButtonHovered]          = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.00, 0.87, 0.42, 1.00)
    colors[clr.Header]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.00, 0.76, 0.37, 0.57)
    colors[clr.HeaderActive]           = ImVec4(0.00, 0.88, 0.42, 0.89)
    colors[clr.Separator]              = ImVec4(1.00, 1.00, 1.00, 0.40)
    colors[clr.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.60)
    colors[clr.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 0.80)
    colors[clr.ResizeGrip]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ResizeGripHovered]      = ImVec4(0.00, 0.76, 0.37, 1.00)
    colors[clr.ResizeGripActive]       = ImVec4(0.00, 0.86, 0.41, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.CloseButtonHovered]     = ImVec4(0.00, 0.88, 0.42, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.00, 1.00, 0.48, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.69, 0.33, 0.72)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.17, 0.17, 0.17, 0.48)
end

function hasRename()
    local SCRIPT_NAME = "TheKingOfMutes"
    local SCRIPT_EXTENSION = ".lua"
    if thisScript().name ~= string.format("%s%s", tostring(SCRIPT_NAME), tostring(SCRIPT_EXTENSION)) then
        return true
    else
        return false
    end
end


function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end

    render_text(text)
end

function cmd_ssd()
        main_window_state.v = not main_window_state.v
	end
	
	





function sampev.onSendChat(text)
   
end
