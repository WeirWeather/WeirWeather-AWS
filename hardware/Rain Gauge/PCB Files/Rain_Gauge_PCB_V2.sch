<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.5.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ic-package" urn="urn:adsk.eagle:library:239">
<description>&lt;b&gt;IC Packages an Sockets&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL08" urn="urn:adsk.eagle:footprint:29416/1" library_version="4">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="5.08" y1="2.921" x2="-5.08" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="5.08" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.921" x2="5.08" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="-5.08" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="-5.08" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.016" x2="-5.08" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-5.334" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-3.556" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SOCKET-08" urn="urn:adsk.eagle:footprint:14332/1" library_version="4">
<description>&lt;b&gt;Dual In Line Socket&lt;/b&gt;</description>
<wire x1="5.08" y1="5.08" x2="-5.08" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.016" x2="-5.08" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="1.016" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="-5.08" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-3.048" y="-0.508" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-2.667" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
</package>
</packages>
<packages3d>
<package3d name="DIL08" urn="urn:adsk.eagle:package:29519/2" type="model" library_version="4">
<description>Dual In Line Package</description>
<packageinstances>
<packageinstance name="DIL08"/>
</packageinstances>
</package3d>
<package3d name="SOCKET-08" urn="urn:adsk.eagle:package:14428/1" type="box" library_version="4">
<description>Dual In Line Socket</description>
<packageinstances>
<packageinstance name="SOCKET-08"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="DIL8" urn="urn:adsk.eagle:symbol:14330/1" library_version="4">
<wire x1="-5.08" y1="3.81" x2="-5.08" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-6.35" x2="5.08" y2="-6.35" width="0.254" layer="94"/>
<wire x1="5.08" y1="-6.35" x2="5.08" y2="3.81" width="0.254" layer="94"/>
<wire x1="5.08" y1="3.81" x2="2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="-5.08" y1="3.81" x2="-2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="3.81" x2="2.54" y2="3.81" width="0.254" layer="94" curve="180"/>
<text x="-4.445" y="4.445" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.445" y="-8.89" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-7.62" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="2" x="-7.62" y="0" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-7.62" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-7.62" y="-5.08" visible="pad" length="short" direction="pas"/>
<pin name="5" x="7.62" y="-5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="6" x="7.62" y="-2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="7" x="7.62" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="8" x="7.62" y="2.54" visible="pad" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DIL8" urn="urn:adsk.eagle:component:14474/3" prefix="IC" uservalue="yes" library_version="4">
<description>&lt;b&gt;Dual In Line / Socket&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="DIL8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL08">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:29519/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="8" constant="no"/>
</technology>
</technologies>
</device>
<device name="S" package="SOCKET-08">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14428/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Library">
<packages>
<package name="QCL16.0000F18B23B">
<wire x1="-5.525" y1="2.325" x2="-5.525" y2="2.335" width="0.127" layer="21"/>
<wire x1="-5.525" y1="2.325" x2="-5.525" y2="-2.325" width="0.127" layer="21"/>
<wire x1="-5.525" y1="-2.325" x2="5.525" y2="-2.325" width="0.127" layer="21"/>
<wire x1="5.525" y1="-2.325" x2="5.525" y2="2.325" width="0.127" layer="21"/>
<wire x1="5.525" y1="2.325" x2="-5.525" y2="2.325" width="0.127" layer="21"/>
<pad name="P$1" x="-2.44" y="0" drill="0.5"/>
<pad name="P$2" x="2.44" y="0" drill="0.5"/>
<text x="-5.5" y="5.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.5" y="3.5" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="C0805C180J5GACTU">
<wire x1="-1" y1="0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="P$1" x="-1.5" y="0" dx="2" dy="1.25" layer="1"/>
<smd name="P$2" x="1.5" y="0" dx="2" dy="1.25" layer="1"/>
<text x="-2.5" y="3" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.5" y="1.5" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="0603YC104KAZ2A">
<wire x1="-0.8" y1="0.405" x2="-0.8" y2="-0.405" width="0.127" layer="21"/>
<wire x1="-0.8" y1="-0.405" x2="0.8" y2="-0.405" width="0.127" layer="21"/>
<wire x1="0.8" y1="-0.405" x2="0.8" y2="0.405" width="0.127" layer="21"/>
<wire x1="0.8" y1="0.405" x2="-0.8" y2="0.405" width="0.127" layer="21"/>
<smd name="P$1" x="-1.45" y="0" dx="0.81" dy="2" layer="1" rot="R90"/>
<smd name="P$2" x="1.45" y="0" dx="0.81" dy="2" layer="1" rot="R90"/>
<text x="-2.5" y="2.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.5" y="1" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="RK73B2ATTD103J">
<wire x1="-1" y1="0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="P$1" x="-1.75" y="0" dx="2" dy="1.25" layer="1"/>
<smd name="P$2" x="1.75" y="0" dx="2" dy="1.25" layer="1"/>
<text x="-2" y="3" size="1.27" layer="25">&gt;NAME</text>
<text x="-2" y="1.5" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="QCL16.0000F18B23B">
<pin name="P$1" x="0" y="6.35" length="middle" rot="R270"/>
<pin name="P$2" x="0" y="-7.62" length="middle" rot="R90"/>
<text x="5.08" y="0" size="1.27" layer="95">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.27" layer="95">&gt;VALUE</text>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="0" width="0.254" layer="94"/>
</symbol>
<symbol name="C0805C180J5GACTU">
<pin name="P$1" x="0" y="6.35" length="middle" rot="R270"/>
<pin name="P$2" x="0" y="-6.35" length="middle" rot="R90"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<text x="5.08" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="0" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="0603YC104KAZ2A">
<pin name="P$1" x="0" y="6.35" length="middle" rot="R270"/>
<pin name="P$2" x="0" y="-6.35" length="middle" rot="R90"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<text x="5.08" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="0" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="RK73B2ATTD103J">
<pin name="P$1" x="0" y="12.7" length="middle" rot="R270"/>
<pin name="P$2" x="0" y="-10.16" length="middle" rot="R90"/>
<wire x1="0" y1="7.62" x2="-2.54" y2="6.35" width="0.254" layer="94"/>
<wire x1="-2.54" y1="6.35" x2="2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="2.54" y1="3.81" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="-2.54" y2="-3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-3.81" x2="0" y2="-5.08" width="0.254" layer="94"/>
<text x="5.08" y="2.54" size="1.27" layer="95">&gt;NAME</text>
<text x="5.08" y="0" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="QCL16.0000F18B23B">
<description>16 MHz Crystal</description>
<gates>
<gate name="G$1" symbol="QCL16.0000F18B23B" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="QCL16.0000F18B23B">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C0805C180J5GACTU">
<description>18 pF 50 V Multilayer Ceramic Capacitor</description>
<gates>
<gate name="G$1" symbol="C0805C180J5GACTU" x="0" y="0"/>
</gates>
<devices>
<device name="" package="C0805C180J5GACTU">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="0603YC104KAZ2A">
<description>100 nF 16 V Multilayer Ceramic Capacitor</description>
<gates>
<gate name="G$1" symbol="0603YC104KAZ2A" x="0" y="0"/>
</gates>
<devices>
<device name="" package="0603YC104KAZ2A">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RK73B2ATTD103J">
<description>10 Kohm 0.25 W</description>
<gates>
<gate name="G$1" symbol="RK73B2ATTD103J" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RK73B2ATTD103J">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X02" urn="urn:adsk.eagle:footprint:22309/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90" urn="urn:adsk.eagle:footprint:22310/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="1X02" urn="urn:adsk.eagle:package:22435/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X02"/>
</packageinstances>
</package3d>
<package3d name="1X02/90" urn="urn:adsk.eagle:package:22437/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X02/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD2" urn="urn:adsk.eagle:symbol:22308/1" library_version="4">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X2" urn="urn:adsk.eagle:component:22516/4" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22435/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="98" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22437/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="24" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="jst-ph">
<packages>
<package name="JST-PH2">
<wire x1="-2.95" y1="-1.7" x2="-0.4" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-0.4" y1="-1.7" x2="0.4" y2="-1.7" width="0.127" layer="21"/>
<wire x1="0.4" y1="-1.7" x2="2.95" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-2.95" y1="2.8" x2="2.95" y2="2.8" width="0.127" layer="21"/>
<wire x1="2.95" y1="2.8" x2="2.95" y2="0.6" width="0.127" layer="21"/>
<wire x1="2.95" y1="0.6" x2="2.95" y2="-0.3" width="0.127" layer="21"/>
<wire x1="2.95" y1="-0.3" x2="2.95" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-2.95" y1="2.8" x2="-2.95" y2="0.6" width="0.127" layer="21"/>
<wire x1="-2.95" y1="0.6" x2="-2.95" y2="-0.3" width="0.127" layer="21"/>
<wire x1="-2.95" y1="-0.3" x2="-2.95" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-2.35" y1="2.2" x2="2.35" y2="2.2" width="0.127" layer="21"/>
<wire x1="-2.35" y1="2.2" x2="-2.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-2.35" y1="0.6" x2="-2.35" y2="-0.3" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-0.3" x2="-2.35" y2="-1.1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.1" x2="-0.4" y2="-1.1" width="0.127" layer="21"/>
<wire x1="2.35" y1="2.2" x2="2.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="2.35" y1="0.6" x2="2.35" y2="-0.3" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.3" x2="2.35" y2="-1.1" width="0.127" layer="21"/>
<wire x1="-2.95" y1="-0.3" x2="-2.35" y2="-0.3" width="0.127" layer="21"/>
<wire x1="-2.95" y1="0.6" x2="-2.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="2.35" y1="0.6" x2="2.95" y2="0.6" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.3" x2="2.95" y2="-0.3" width="0.127" layer="21"/>
<wire x1="0.4" y1="-1.1" x2="2.35" y2="-1.1" width="0.127" layer="21"/>
<wire x1="0.4" y1="-1.1" x2="0.4" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-0.4" y1="-1.1" x2="-0.4" y2="-1.7" width="0.127" layer="21"/>
<pad name="2" x="-1" y="0" drill="0.8128" diameter="1.6764" shape="octagon"/>
<pad name="1" x="1" y="0" drill="0.8128" diameter="1.6764" shape="octagon"/>
<text x="-3" y="3.5001" size="1.27" layer="25">&gt;NAME</text>
<text x="0.9001" y="-3.4999" size="1.27" layer="21">1</text>
</package>
</packages>
<symbols>
<symbol name="CON02">
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="5.08" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="2.54" width="0.1524" layer="94"/>
<wire x1="5.08" y1="2.54" x2="-2.54" y2="2.54" width="0.1524" layer="94"/>
<text x="-2.54" y="3.302" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-7.366" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="7.62" y="-2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="1" x="7.62" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="JST-PH2" prefix="P" uservalue="yes">
<gates>
<gate name="G$1" symbol="CON02" x="0" y="0"/>
</gates>
<devices>
<device name="" package="JST-PH2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="ATTINY85" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL8" device="" package3d_urn="urn:adsk.eagle:package:29519/2"/>
<part name="U$1" library="Library" deviceset="QCL16.0000F18B23B" device=""/>
<part name="U$2" library="Library" deviceset="C0805C180J5GACTU" device=""/>
<part name="U$3" library="Library" deviceset="C0805C180J5GACTU" device=""/>
<part name="DEC_CAP" library="Library" deviceset="0603YC104KAZ2A" device=""/>
<part name="REED_SWITCH_R" library="Library" deviceset="RK73B2ATTD103J" device=""/>
<part name="I2C" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X2" device="" package3d_urn="urn:adsk.eagle:package:22435/2"/>
<part name="RESET_PULLUP" library="Library" deviceset="RK73B2ATTD103J" device=""/>
<part name="POWER" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X2" device="" package3d_urn="urn:adsk.eagle:package:22435/2"/>
<part name="P1" library="jst-ph" deviceset="JST-PH2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="ATTINY85" gate="G$1" x="63.5" y="58.42" smashed="yes">
<attribute name="NAME" x="59.055" y="62.865" size="1.778" layer="95"/>
<attribute name="VALUE" x="59.055" y="49.53" size="1.778" layer="96"/>
</instance>
<instance part="U$1" gate="G$1" x="25.4" y="55.88" smashed="yes">
<attribute name="NAME" x="30.48" y="55.88" size="1.27" layer="95"/>
</instance>
<instance part="U$2" gate="G$1" x="25.4" y="71.12" smashed="yes">
<attribute name="NAME" x="30.48" y="71.12" size="1.778" layer="95"/>
</instance>
<instance part="U$3" gate="G$1" x="25.4" y="40.64" smashed="yes">
<attribute name="NAME" x="30.48" y="40.64" size="1.778" layer="95"/>
</instance>
<instance part="DEC_CAP" gate="G$1" x="76.2" y="43.18" smashed="yes">
<attribute name="NAME" x="78.74" y="45.72" size="1.778" layer="95"/>
</instance>
<instance part="REED_SWITCH_R" gate="G$1" x="111.76" y="38.1" smashed="yes">
<attribute name="NAME" x="116.84" y="40.64" size="1.27" layer="95"/>
</instance>
<instance part="I2C" gate="G$1" x="127" y="53.34" smashed="yes">
<attribute name="NAME" x="120.65" y="59.055" size="1.778" layer="95"/>
<attribute name="VALUE" x="120.65" y="48.26" size="1.778" layer="96"/>
</instance>
<instance part="RESET_PULLUP" gate="G$1" x="66.04" y="73.66" smashed="yes" rot="R270">
<attribute name="NAME" x="66.04" y="68.58" size="1.27" layer="95"/>
</instance>
<instance part="POWER" gate="G$1" x="127" y="78.74" smashed="yes">
<attribute name="NAME" x="120.65" y="84.455" size="1.778" layer="95"/>
<attribute name="VALUE" x="120.65" y="73.66" size="1.778" layer="96"/>
</instance>
<instance part="P1" gate="G$1" x="127" y="22.86" smashed="yes" rot="R180">
<attribute name="NAME" x="129.54" y="19.558" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="129.54" y="30.226" size="1.778" layer="96" rot="R180"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="XTAL1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="P$1"/>
<pinref part="U$2" gate="G$1" pin="P$2"/>
<wire x1="25.4" y1="62.23" x2="25.4" y2="63.5" width="0.1524" layer="91"/>
<pinref part="ATTINY85" gate="G$1" pin="2"/>
<wire x1="25.4" y1="63.5" x2="25.4" y2="64.77" width="0.1524" layer="91"/>
<wire x1="55.88" y1="58.42" x2="40.64" y2="58.42" width="0.1524" layer="91"/>
<wire x1="40.64" y1="58.42" x2="40.64" y2="63.5" width="0.1524" layer="91"/>
<wire x1="40.64" y1="63.5" x2="25.4" y2="63.5" width="0.1524" layer="91"/>
<junction x="25.4" y="63.5"/>
<label x="43.18" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="XTAL2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="P$2"/>
<pinref part="U$3" gate="G$1" pin="P$1"/>
<wire x1="25.4" y1="48.26" x2="25.4" y2="46.99" width="0.1524" layer="91"/>
<pinref part="ATTINY85" gate="G$1" pin="3"/>
<wire x1="55.88" y1="55.88" x2="40.64" y2="55.88" width="0.1524" layer="91"/>
<wire x1="40.64" y1="55.88" x2="40.64" y2="48.26" width="0.1524" layer="91"/>
<wire x1="40.64" y1="48.26" x2="25.4" y2="48.26" width="0.1524" layer="91"/>
<junction x="25.4" y="48.26"/>
<label x="43.18" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U$3" gate="G$1" pin="P$2"/>
<wire x1="25.4" y1="34.29" x2="25.4" y2="22.86" width="0.1524" layer="91"/>
<wire x1="25.4" y1="22.86" x2="53.34" y2="22.86" width="0.1524" layer="91"/>
<wire x1="53.34" y1="22.86" x2="53.34" y2="53.34" width="0.1524" layer="91"/>
<pinref part="ATTINY85" gate="G$1" pin="4"/>
<wire x1="53.34" y1="53.34" x2="55.88" y2="53.34" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$1"/>
<wire x1="25.4" y1="77.47" x2="25.4" y2="78.74" width="0.1524" layer="91"/>
<wire x1="25.4" y1="78.74" x2="17.78" y2="78.74" width="0.1524" layer="91"/>
<wire x1="17.78" y1="78.74" x2="17.78" y2="22.86" width="0.1524" layer="91"/>
<wire x1="17.78" y1="22.86" x2="25.4" y2="22.86" width="0.1524" layer="91"/>
<junction x="25.4" y="22.86"/>
<pinref part="DEC_CAP" gate="G$1" pin="P$2"/>
<wire x1="76.2" y1="36.83" x2="76.2" y2="22.86" width="0.1524" layer="91"/>
<wire x1="76.2" y1="22.86" x2="53.34" y2="22.86" width="0.1524" layer="91"/>
<junction x="53.34" y="22.86"/>
<wire x1="119.38" y1="22.86" x2="76.2" y2="22.86" width="0.1524" layer="91"/>
<junction x="76.2" y="22.86"/>
<junction x="25.4" y="78.74"/>
<wire x1="25.4" y1="78.74" x2="124.46" y2="78.74" width="0.1524" layer="91"/>
<pinref part="POWER" gate="G$1" pin="2"/>
<pinref part="P1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="3.3V" class="0">
<segment>
<pinref part="ATTINY85" gate="G$1" pin="8"/>
<wire x1="71.12" y1="60.96" x2="76.2" y2="60.96" width="0.1524" layer="91"/>
<label x="78.74" y="60.96" size="1.778" layer="95"/>
<pinref part="DEC_CAP" gate="G$1" pin="P$1"/>
<wire x1="76.2" y1="60.96" x2="76.2" y2="49.53" width="0.1524" layer="91"/>
<junction x="76.2" y="60.96"/>
<pinref part="REED_SWITCH_R" gate="G$1" pin="P$1"/>
<wire x1="76.2" y1="60.96" x2="86.36" y2="60.96" width="0.1524" layer="91"/>
<wire x1="86.36" y1="60.96" x2="111.76" y2="60.96" width="0.1524" layer="91"/>
<wire x1="111.76" y1="60.96" x2="111.76" y2="50.8" width="0.1524" layer="91"/>
<pinref part="RESET_PULLUP" gate="G$1" pin="P$1"/>
<wire x1="78.74" y1="73.66" x2="86.36" y2="73.66" width="0.1524" layer="91"/>
<wire x1="86.36" y1="73.66" x2="86.36" y2="60.96" width="0.1524" layer="91"/>
<junction x="86.36" y="60.96"/>
<wire x1="111.76" y1="60.96" x2="111.76" y2="81.28" width="0.1524" layer="91"/>
<junction x="111.76" y="60.96"/>
<pinref part="POWER" gate="G$1" pin="1"/>
<wire x1="111.76" y1="81.28" x2="124.46" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="ATTINY85" gate="G$1" pin="7"/>
<label x="78.74" y="58.42" size="1.778" layer="95"/>
<wire x1="71.12" y1="58.42" x2="116.84" y2="58.42" width="0.1524" layer="91"/>
<wire x1="116.84" y1="58.42" x2="116.84" y2="55.88" width="0.1524" layer="91"/>
<pinref part="I2C" gate="G$1" pin="1"/>
<wire x1="116.84" y1="55.88" x2="124.46" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PB1" class="0">
<segment>
<pinref part="ATTINY85" gate="G$1" pin="6"/>
<wire x1="71.12" y1="55.88" x2="91.44" y2="55.88" width="0.1524" layer="91"/>
<label x="78.74" y="55.88" size="1.778" layer="95"/>
<wire x1="91.44" y1="55.88" x2="91.44" y2="25.4" width="0.1524" layer="91"/>
<wire x1="91.44" y1="25.4" x2="111.76" y2="25.4" width="0.1524" layer="91"/>
<pinref part="REED_SWITCH_R" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="25.4" x2="111.76" y2="27.94" width="0.1524" layer="91"/>
<wire x1="111.76" y1="25.4" x2="119.38" y2="25.4" width="0.1524" layer="91"/>
<junction x="111.76" y="25.4"/>
<pinref part="P1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="ATTINY85" gate="G$1" pin="5"/>
<label x="78.74" y="53.34" size="1.778" layer="95"/>
<pinref part="I2C" gate="G$1" pin="2"/>
<wire x1="71.12" y1="53.34" x2="124.46" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="RESET" class="0">
<segment>
<pinref part="ATTINY85" gate="G$1" pin="1"/>
<wire x1="55.88" y1="60.96" x2="50.8" y2="60.96" width="0.1524" layer="91"/>
<pinref part="RESET_PULLUP" gate="G$1" pin="P$2"/>
<wire x1="50.8" y1="60.96" x2="50.8" y2="73.66" width="0.1524" layer="91"/>
<wire x1="50.8" y1="73.66" x2="55.88" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
