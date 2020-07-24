<xsl:stylesheet version="1.0" xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- 2011.12.13 USER_REMARK 추가 수정-->
<xsl:param name="USER_REMARK"/>
	<xsl:template name="replace-string">
		<xsl:param name="text"/>
		<xsl:param name="replace"/>
		<xsl:param name="with"/>
		<xsl:choose>
			<xsl:when test="contains($text,$replace)">
				<xsl:value-of select="substring-before($text,$replace)"/>
				<xsl:value-of select="$with"/>
				<xsl:call-template name="replace-string">
					<xsl:with-param name="text" select="substring-after($text,$replace)"/>
					<xsl:with-param name="replace" select="$replace"/>
					<xsl:with-param name="with" select="$with"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
    <xsl:template name="subfieldSelect">
        <xsl:param name="codes">abcdefghijklmnopqrstuvwxyz1234567890</xsl:param>
        <xsl:param name="delimeter">
            <xsl:text/>
        </xsl:param>
        <xsl:for-each select="marc:subfield">
             <xsl:if test="contains($codes, @code)">
                 <xsl:value-of select="text()"/>
                 <xsl:if test="position()!=last()">
                     <xsl:value-of select="$delimeter"/>
                 </xsl:if> 
             </xsl:if>
         </xsl:for-each>
    </xsl:template>
	
	<xsl:template name="subfieldSelectLink130">
		<xsl:param name="codes">abcdefghijklmnopqrstuvwxyz1234567890</xsl:param>
		<xsl:param name="links"><xsl:text/></xsl:param>
		<xsl:param name="searchMethod"><xsl:text/></xsl:param>
		<xsl:param name="searchNum"><xsl:text/></xsl:param>
		<xsl:param name="delimeter"><xsl:text/></xsl:param>
		<xsl:variable name="str">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($codes, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
  		<xsl:variable name="str2"><xsl:value-of select="substring(translate($str,&apos;,&apos;,&apos;&apos;),1,string-length(translate($str,&apos;,&apos;,&apos;&apos;))-string-length($delimeter))"/></xsl:variable>
  		<xsl:variable name="linkstr">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($links, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
  		</xsl:variable>
  		<xsl:variable name="linkstr2"><xsl:value-of select="substring(translate($linkstr,&apos;,&apos;,&apos;&apos;),1,string-length(translate($linkstr,&apos;,&apos;,&apos;&apos;))-string-length($delimeter))"/></xsl:variable>
 		<a href="/search/tot/result?st=FRNT&amp;si={$searchNum}&amp;q={$linkstr2}" title="이 키워드로 더 검색하기">
			<xsl:value-of select="substring($str,1,string-length($str)-string-length($delimeter))"/>
		</a>
	</xsl:template>
	
	<xsl:template name="subfieldSelectLink600">
		<xsl:param name="codes">abcdefghijklmnopqrstuvwxyz1234567890</xsl:param>
		<xsl:param name="links"><xsl:text/></xsl:param>
		<xsl:param name="searchMethod"><xsl:text/></xsl:param>
		<xsl:param name="searchNum"><xsl:text/></xsl:param>
		<xsl:param name="delimeter"><xsl:text/></xsl:param>
		<xsl:variable name="str">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($codes, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
  		<xsl:variable name="str2"><xsl:value-of select="substring(translate($str,&apos;,&apos;,&apos;&apos;),1,string-length(translate($str,&apos;,&apos;,&apos;&apos;))-string-length($delimeter))"/></xsl:variable>
  		<xsl:variable name="linkstr">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($links, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
  		</xsl:variable>
  		<xsl:variable name="linkstr2"><xsl:value-of select="substring(translate($linkstr,&apos;,&apos;,&apos;&apos;),1,string-length(translate($linkstr,&apos;,&apos;,&apos;&apos;))-string-length($delimeter))"/></xsl:variable>
 		<a href="/search/tot/result?st=FRNT&amp;si={$searchNum}&amp;q={$linkstr2}" title="이 키워드로 더 검색하기">
			<xsl:value-of select="substring($str,1,string-length($str)-string-length($delimeter))"/>
		</a>
	</xsl:template>
	
	<xsl:template name="subfieldSelectLink650">
		<xsl:param name="codes">abcdefghijklmnopqrstuvwxyz1234567890</xsl:param>
		<xsl:param name="delimeter">
			<xsl:text/>
		</xsl:param>
		<xsl:param name="searchNum">
			<xsl:text/>
		</xsl:param>
		<xsl:variable name="str">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($codes, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<a href="/search/tot/result?st=FRNT&amp;si={$searchNum}&amp;q={$str}" title="이 키워드로 더 검색하기">
			<xsl:value-of select="substring($str,1,string-length($str)-string-length($delimeter))"/>
		</a>
	</xsl:template>
	
    <xsl:template name="subfieldSelectLink700">
        <xsl:param name="codes">abcdefghijklmnopqrstuvwxyz1234567890</xsl:param>
        <xsl:param name="delimeter">
            <xsl:text/>
        </xsl:param>
        <xsl:param name="searchNum">
            <xsl:text/>
        </xsl:param>
        <xsl:variable name="str">
            <xsl:for-each select="marc:subfield">
                <xsl:if test="contains($codes, @code)">
                    <xsl:value-of select="text()"/>
                    <xsl:value-of select="$delimeter"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="str2">
            <xsl:value-of select="substring(translate($str,&apos;,&apos;,&apos;&apos;),1,string-length(translate($str,&apos;,&apos;,&apos;&apos;))-string-length($delimeter))"/>
        </xsl:variable>
        <xsl:variable name="punctuation">
        	<xsl:value-of select="substring($str,string-length($str)-string-length($delimeter),1)"/>
        </xsl:variable>
        <a href="/search/tot/result?st=FRNT&amp;si={$searchNum}&amp;q={$str2}" title="이 키워드로 더 검색하기">
        	<xsl:choose>
        		<xsl:when test="($punctuation=&apos;,&apos;) or ($punctuation=&apos;;&apos;)"><xsl:value-of select="substring($str,1,string-length($str)-string-length($delimeter)-1)"/></xsl:when>
        		<xsl:otherwise><xsl:value-of select="substring($str,1,string-length($str)-string-length($delimeter))"/></xsl:otherwise>
        	</xsl:choose>
        </a>
        <xsl:if test="($punctuation=&apos;,&apos;) or ($punctuation=&apos;;&apos;)"><xsl:value-of select="$punctuation"/></xsl:if>
    </xsl:template>
    	
	<xsl:template name="subfieldSelectLink856">
		<xsl:param name="codes">abcdefghijklmnopqrstuvwxy1234567890</xsl:param>
		<xsl:param name="codes2">z</xsl:param>
		<xsl:param name="name">
			<xsl:text/>
		</xsl:param>
		<xsl:if test="position() = '1'">
		<xsl:for-each select="marc:subfield">
			<xsl:if test="contains($codes, @code)">
                <xsl:variable name="text" select="translate(text(),&apos;,&apos;,&apos;&apos;)"/>
                <a href="#" onClick="javascript:openMediaView(this,&apos;CONTROLNO&apos;,&apos;URL&apos;,&apos;{$text}&apos;); return false;" target="URL">
                	URL
                </a>
			</xsl:if>
		</xsl:for-each>
		</xsl:if>
		<xsl:for-each select="marc:subfield">
			<xsl:if test="contains($codes2, @code)">
				<xsl:variable name="text" select="translate(text(),&apos;,&apos;,&apos;&apos;)"/>
				: <xsl:value-of select="$text"/>
				<br/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
    	
	<xsl:template name="subfieldSelectLinkAuthor">
		<xsl:param name="codes">abcdefghijklmnopqrstuvwxyz1234567890</xsl:param>
		<xsl:param name="links"><xsl:text/></xsl:param>
		<xsl:param name="searchMethod"><xsl:text/></xsl:param>
		<xsl:param name="searchNum"><xsl:text/></xsl:param>
		<xsl:param name="delimeter"><xsl:text/></xsl:param>
		<xsl:variable name="str">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($codes, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
  		<xsl:variable name="str2"><xsl:value-of select="substring(translate($str,&apos;,&apos;,&apos;&apos;),1,string-length(translate($str,&apos;,&apos;,&apos;&apos;))-string-length($delimeter))"/></xsl:variable>
  		<xsl:variable name="linkstr">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($links, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
  		</xsl:variable>
  		<xsl:variable name="linkstr2"><xsl:value-of select="substring(translate($linkstr,&apos;,&apos;,&apos;&apos;),1,string-length(translate($linkstr,&apos;,&apos;,&apos;&apos;))-string-length($delimeter))"/></xsl:variable>
 		<a href="/search/tot/result?st={$searchMethod}&amp;si={$searchNum}&amp;q={$linkstr2}" title="이 키워드로 더 검색하기">
			<xsl:value-of select="substring($str,1,string-length($str)-string-length($delimeter))"/>
		</a>
	</xsl:template>

	<xsl:template name="subfieldSelectLink">
		<xsl:param name="codes">abcdefghijklmnopqrstuvwxyz1234567890</xsl:param>
		<xsl:param name="name">
			<xsl:text/>
		</xsl:param>
		<xsl:param name="searchNum">
			<xsl:text/>
		</xsl:param>
		<xsl:param name="delimeter">
			<xsl:text/>
		</xsl:param>
		<xsl:for-each select="marc:subfield">
			<xsl:if test="contains($codes, @code)">
				<xsl:variable name="text" select="translate(text(),&apos;,&apos;,&apos;&apos;)"/>
				<a href="/search/tot/result?st=FRNT&amp;si={$searchNum}&amp;q={$text}" title="이 키워드로 더 검색하기">
					<xsl:value-of select="."/>
				</a>
		      <xsl:if test="position()!=last()">
		        <xsl:value-of select="$delimeter"/>
		      </xsl:if>				
			</xsl:if>
		</xsl:for-each>
	</xsl:template>	

	<xsl:output encoding="utf-8" method="xml"/>
	<xsl:template match="/">
		<table class="profiletable" summary="이 표는 서지상세정보를 나타내고 있습니다." border="1" cellspacing="0">
			<caption class="dpn">상세정보</caption>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="marc:record">
		<xsl:variable name="leader" select="marc:leader"/>
		<xsl:variable name="leader6" select="substring($leader,7,1)"/>
		<xsl:variable name="leader7" select="substring($leader,8,1)"/>
		<xsl:variable name="marctype">
			<xsl:choose>
				<xsl:when test="$leader6=&apos;a&apos;">
					<!--BOOK OR SERIALS-->
					<xsl:choose>
						<xsl:when test="marc:datafield[@tag=502]">t</xsl:when>
						<xsl:when test="$leader7=&apos;a&apos;">m</xsl:when>
						<xsl:when test="$leader7=&apos;c&apos;">m</xsl:when>
						<xsl:when test="$leader7=&apos;d&apos;">m</xsl:when>
						<xsl:when test="$leader7=&apos;m&apos;">m</xsl:when>
						<xsl:otherwise>s</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$leader6=&apos;m&apos;">c</xsl:when>
				<xsl:when test="$leader6=&apos;e&apos;">p</xsl:when>
				<xsl:when test="$leader6=&apos;f&apos;">p</xsl:when>
				<xsl:when test="$leader6=&apos;c&apos;">b</xsl:when>
				<xsl:when test="$leader6=&apos;d&apos;">b</xsl:when>
				<xsl:when test="$leader6=&apos;i&apos;">u</xsl:when>
				<xsl:when test="$leader6=&apos;j&apos;">u</xsl:when>
				<xsl:when test="$leader6=&apos;k&apos;">v</xsl:when>
				<xsl:when test="$leader6=&apos;o&apos;">v</xsl:when>
				<xsl:when test="$leader6=&apos;r&apos;">v</xsl:when>
				<xsl:when test="$leader6=&apos;g&apos;">v</xsl:when>
				<xsl:when test="$leader6=&apos;z&apos;">a</xsl:when>
				<xsl:when test="$leader6=&apos;u&apos;">h</xsl:when>
				<xsl:when test="$leader6=&apos;v&apos;">h</xsl:when>
				<xsl:when test="$leader6=&apos;x&apos;">h</xsl:when>
				<xsl:when test="$leader6=&apos;y&apos;">h</xsl:when>
				<xsl:when test="$leader6=&apos;w&apos;">o</xsl:when>
				<xsl:otherwise>x</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr>
			<th scope="row">자료유형</th>
			<td>
				<xsl:choose>
					<xsl:when test="$marctype=&apos;m&apos;">도서</xsl:when>
					<xsl:when test="$marctype=&apos;c&apos;">컴퓨터파일</xsl:when>
					<xsl:when test="$marctype=&apos;t&apos;">학위논문</xsl:when>
					<xsl:when test="$marctype=&apos;b&apos;">악보</xsl:when>
					<xsl:when test="$marctype=&apos;o&apos;">고서</xsl:when>
					<xsl:when test="$marctype=&apos;s&apos;">연간물</xsl:when>
					<xsl:when test="$marctype=&apos;p&apos;">지도</xsl:when>
					<xsl:when test="$marctype=&apos;u&apos;">오디오</xsl:when>
					<xsl:when test="$marctype=&apos;v&apos;">비디오</xsl:when>
					<xsl:when test="$marctype=&apos;x&apos;">기타비도서</xsl:when>
					<xsl:when test="$marctype=&apos;z&apos;">기타자료</xsl:when>
					<xsl:when test="$marctype=&apos;zpro&apos;">Proceeding</xsl:when>
					<xsl:when test="$marctype=&apos;zlet&apos;">Newsletter</xsl:when>
					<xsl:when test="$marctype=&apos;zpap&apos;">Newspaper</xsl:when>
					<xsl:when test="$marctype=&apos;zjor&apos;">저널</xsl:when>
					<xsl:when test="$marctype=&apos;zebk&apos;">e-Book</xsl:when>
					<xsl:when test="$marctype=&apos;zetc&apos;">기타저널</xsl:when>
					<xsl:when test="$marctype=&apos;zjcs&apos;">저널기사</xsl:when>
					<xsl:otherwise>기타자료</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
        <xsl:if test="not($marctype=&apos;a&apos;)">
            <xsl:for-each select="marc:datafield[@tag=245]">
                <tr>
                <th scope="row">서명/저자사항</th>
                    <td>
                        <xsl:call-template name="subfieldSelect">
                            <xsl:with-param name="codes">anxbcdefghklmp</xsl:with-param>
                            <xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
                        </xsl:call-template>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:if>
		<xsl:if test="marc:datafield[@tag=100]|marc:datafield[@tag=700]">
			<tr>
				<th scope="row">개인저자</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=100]|marc:datafield[@tag=700]">
                        <xsl:call-template name="subfieldSelectLink700">
                            <xsl:with-param name="codes">a</xsl:with-param>
                            <xsl:with-param name="name">개인저자</xsl:with-param>
                            <xsl:with-param name="searchNum">2</xsl:with-param>
                            <xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
                        </xsl:call-template>
                        <xsl:call-template name="subfieldSelect">
                            <xsl:with-param name="codes">bcdegijkqu</xsl:with-param>
                            <xsl:with-param name="name">개인저자</xsl:with-param>
                            <xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
                        </xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=110]|marc:datafield[@tag=710]">
			<tr>
				<th scope="row">단체저자명</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=110]|marc:datafield[@tag=710]">
						<xsl:call-template name="subfieldSelectLink700">
							<xsl:with-param name="name">단체저자</xsl:with-param>
							<xsl:with-param name="searchNum">2</xsl:with-param>
							<xsl:with-param name="codes">abndc</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">efghklm</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="marc:datafield[@tag=250]">
			<tr>
				<th scope="row">판사항</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">ab</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=362]">
			<tr>
				<th scope="row">권.연차 사항</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">a</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=260]">
			<tr>
				<th scope="row">발행사항</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">ab3cefg</xsl:with-param>
						<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=263]">
			<tr>
				<th scope="row">발행예정일자</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">a</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:if test="not($marctype=&apos;a&apos;)">
			<xsl:for-each select="marc:datafield[@tag=300]">
				<tr>
					<th scope="row">형태사항</th>
					<td>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abce</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
        <xsl:if test="not($marctype=&apos;a&apos;)">
            <xsl:if test="marc:datafield[@tag=440]|marc:datafield[@tag=490]">
                <tr>
                    <th scope="row">총서사항</th>
                    <td>
                        <xsl:for-each select="marc:datafield[@tag=440]|marc:datafield[@tag=490]">
                            <xsl:call-template name="subfieldSelectLink700">
                                <xsl:with-param name="codes">a</xsl:with-param>
                                <xsl:with-param name="name">총서사항</xsl:with-param>
                                <xsl:with-param name="searchNum">1</xsl:with-param>
                            	<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
                            </xsl:call-template>
                            <xsl:call-template name="subfieldSelect">
                                <xsl:with-param name="codes">pnsvx</xsl:with-param>
	                            <xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
                            </xsl:call-template>
                            <br/>
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>       
		<xsl:if test="$marctype=&apos;a&apos;">
			<xsl:if test="marc:datafield[@tag=773]">
				<tr>
					<th scope="row">기본자료저록</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=100]|marc:datafield[@tag=700]">
							<xsl:call-template name="subfieldSelectLink">
								<xsl:with-param name="codes">t</xsl:with-param>
								<xsl:with-param name="name">기본자료저록</xsl:with-param>
								<xsl:with-param name="searchNum">11</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">asbcdgkruwxyz</xsl:with-param>
							</xsl:call-template>
							<br/>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$marctype=&apos;a&apos;">
			<xsl:for-each select="marc:datafield[@tag=300]">
				<tr>
					<th scope="row">수록페이지</th>
					<td>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcde</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
		<xsl:for-each select="marc:datafield[@tag=257]">
			<tr>
				<th scope="row">기록필름제작국명</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">a</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:if test="marc:datafield[@tag=340]">
			<tr>
				<th scope="row">물리적매체</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=340]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdefhi3</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=351]">
			<tr>
				<th scope="row">자료의 구조와 배열</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=351]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abc3</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="marc:datafield[@tag=254]">
			<tr>
				<th scope="row">악보표현형식</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">a</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=310]">
			<tr>
				<th scope="row">간행빈도</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">ab</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:if test="marc:datafield[@tag=321]">
			<tr>
				<th scope="row">이전간행빈도</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=321]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">ab</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=355]">
			<tr>
				<th scope="row">보안분류</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=355]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdf</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=210]">
			<tr>
				<th scope="row">축약표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=210]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">ab2</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=222]">
			<tr>
				<th scope="row">등록표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=222]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">ab</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=246 and @ind2='0' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">부분표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='0' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=246 and @ind2='1' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">대등표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='1' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=246 and @ind2='2' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">식별표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='2' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=246 and @ind2='4' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">표지표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='4' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=246 and @ind2='5' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">부표지표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='5' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=246 and @ind2='6' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">권두표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='6' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=246 and @ind2='7' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">난외표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='7' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=246 and @ind2='8' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">책등표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='8' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=246 and @ind2='9' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">원서명</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='9' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelectLink">
                             <xsl:with-param name="codes">a</xsl:with-param>
                             <xsl:with-param name="name">원서명</xsl:with-param>
                             <xsl:with-param name="searchNum">1</xsl:with-param>
						</xsl:call-template>
                        <xsl:call-template name="subfieldSelect">
                             <xsl:with-param name="codes">bfghinp</xsl:with-param>
                        </xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>				
		<xsl:if test="marc:datafield[@tag=246 and @ind2='3' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]|marc:datafield[@tag=246 and contains('012', @ind1) and @ind2=' ' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
			<tr>
				<th scope="row">기타표제</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2='3' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag=246 and @ind2=' ' and @ind1!=&apos;2&apos; and @ind1!=&apos;3&apos;]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abfghinp</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=785 and @ind1='0']">
			<tr>
				<th scope="row">후속저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=785]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=780 and @ind1='0']">
			<tr>
				<th scope="row">선행저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=780]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=765 and @ind1='0']">
			<tr>
				<th scope="row">원저저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=765]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=767 and @ind1='0']">
			<tr>
				<th scope="row">번역저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=767]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=770 and @ind1='0']">
			<tr>
				<th scope="row">보유판 및 특별호 저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=770]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=772 and @ind1='0']">
			<tr>
				<th scope="row">모체 레코드</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=772]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=773 and @ind1='0']">
			<tr>
				<th scope="row">기본자료 저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=773]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=775 and @ind1='0']">
			<tr>
				<th scope="row">이판저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=775]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=776 and @ind1='0']">
			<tr>
				<th scope="row">기타형태 저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=776]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=787 and @ind1='0']">
			<tr>
				<th scope="row">비특정적 관계 저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=787]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=774 and @ind1='0']">
			<tr>
				<th scope="row">개별권호사항</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=774]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=777 and @ind1='0']">
			<tr>
				<th scope="row">동시발행 저록</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=777]">
						<xsl:variable name="wvalue" select="marc:subfield[@code='w']"/>
						<xsl:if test="string(number($wvalue)) != 'NaN'">
						<xsl:variable name="ctrl" select='format-number($wvalue,"000000000000")'/>
						<a href="/search/detail/CATTOT{$ctrl}">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</a>
						</xsl:if>
						<xsl:if test="string(number($wvalue)) = 'NaN'">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdghikmnorstuxyz</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>							
						</xsl:call-template>
						</xsl:if>
						<br/> 
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=020]">
			<tr>
				<th scope="row">ISBN</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=020]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=022]">
			<tr>
				<th scope="row">ISSN</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=022]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=024]">
			<tr>
				<th scope="row">기타표준부호</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=024]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">ad2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=028]">
			<tr>
				<th scope="row">발행자번호</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=028]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">ab</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=030]">
			<tr>
				<th scope="row">CODEN</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=030]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=086]">
			<tr>
				<th scope="row">정부문서번호</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=086]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=027]">
			<tr>
				<th scope="row">표준보고서번호</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=027]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=088]">
			<tr>
				<th scope="row">보고서번호</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=088]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="$marctype=&apos;t&apos;">
			<xsl:if test="marc:datafield[@tag=502]">
				<tr>
					<th scope="row">학위논문주기</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=502]">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">abcd</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="marc:datafield[@tag=085]">
				<tr>
					<th scope="row">학과코드</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=085]">
							<xsl:call-template name="subfieldSelectLink">
								<xsl:with-param name="codes">a</xsl:with-param>
								<xsl:with-param name="name">학과코드</xsl:with-param>
								<xsl:with-param name="searchNum">13</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>
		<xsl:variable name="text500" select="marc:datafield[@tag=500]"/>
		<xsl:if test="string-length($text500) = 0">
			<xsl:if test="string-length($USER_REMARK) != 0">
				<th scope="row">일반주기</th>
				<td>
            		<xsl:value-of select="$USER_REMARK"/>
				</td>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length($text500) != 0">
			<xsl:if test="marc:datafield[@tag=500]">
				<tr>
					<th scope="row">일반주기</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=500]">
							<xsl:value-of select="."/>
							<br/>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=501]">
			<tr>
				<th scope="row">합철본</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=501]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="$marctype=&apos;m&apos;">
			<xsl:if test="marc:datafield[@tag=503]">
				<tr>
					<th scope="row">서지내력사항</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=503]">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">a</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=504]">
			<tr>
				<th scope="row">서지주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=504]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">ab</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=505]">
			<tr>
				<th scope="row">내용주기</th>
				<td>
                    <xsl:for-each select="marc:datafield[@tag=505]">
                        <xsl:call-template name="subfieldSelect">
                            <xsl:with-param name="codes">agrtuinde</xsl:with-param>
                            <xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
                        </xsl:call-template>
                    <br/>
                    </xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=506]">
			<tr>
				<th scope="row">이용제한사항</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=506]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcde3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=510]">
			<tr>
				<th scope="row">색인/초록 수록지</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=510]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcx3</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=507]">
			<tr>
				<th scope="row">원서명</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=507]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">atxz</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=508]">
			<tr>
				<th scope="row">제작진주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=508]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=511]">
			<tr>
				<th scope="row">연주자/배역진</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=511]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=518]">
			<tr>
				<th scope="row">촬영/녹음일시/장소</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=518]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="marc:datafield[@tag=515]">
			<tr>
				<th scope="row">특수한 권차표시</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">a</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=520]">
			<xsl:if test="marc:subfield[@code='a']">
			<tr>
				<th scope="row">요약</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">a</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=520]">
			<xsl:if test="marc:subfield[@code='b']">
			<tr>
				<th scope="row">초록</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">b</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=520]">
			<xsl:if test="marc:subfield[@code='c']">
			<tr>
				<th scope="row">해제</th>
				<td>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">c</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="marc:datafield[@tag=521]">
			<tr>
				<th scope="row">이용대상자</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=521]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=525]">
			<tr>
				<th scope="row">부록주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=525]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=524]">
			<tr>
				<th scope="row">인용자료주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=524]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=530]">
			<tr>
				<th scope="row">이용가능한<br/>다른형태자료</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=530]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcu3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=533]">
			<tr>
				<th scope="row">복제주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=533]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdefmn3</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=534]">
			<tr>
				<th scope="row">원본주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=534]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcefklmnptxz</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=535]">
			<tr>
				<th scope="row">원본/복제본의 소장처</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=535]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdg3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=536]">
			<tr>
				<th scope="row">기금정보주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=536]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdefgh</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=540]">
			<tr>
				<th scope="row">제한주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=540]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcd3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=541]">
			<tr>
				<th scope="row">입수처</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=541]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcd3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>		
		<xsl:if test="marc:datafield[@tag=547]">
			<tr>
				<th scope="row">변경전 표제설명 주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=547]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=561]">
			<tr>
				<th scope="row">자료내력주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=561]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=550]">
			<tr>
				<th scope="row">발행자주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=550]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=555]">
			<tr>
				<th scope="row">누적색인</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=555]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdu3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=580]">
			<tr>
				<th scope="row">연관저록주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=580]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=538]">
			<tr>
				<th scope="row">시스템주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=538]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=556]">
			<tr>
				<th scope="row">다큐멘테이션</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=556]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">az</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=586]">
			<tr>
				<th scope="row">수상주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=586]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a3</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=565]">
			<tr>
				<th scope="row">파일특성주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=565]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=581]">
			<tr>
				<th scope="row">참조정보원</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=581]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">az3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=585]">
			<tr>
				<th scope="row">전시주기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=585]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">a36</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=111]|marc:datafield[@tag=711]">
			<tr>
				<th scope="row">회의명</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=111]">
						<xsl:call-template name="subfieldSelectLink">
							<xsl:with-param name="codes">a</xsl:with-param>
							<xsl:with-param name="name">회의명</xsl:with-param>
							<xsl:with-param name="searchNum">2</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">cdefgklnpqtu4</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag=711]">
						<xsl:call-template name="subfieldSelectLink">
							<xsl:with-param name="codes">a</xsl:with-param>
							<xsl:with-param name="name">회의명</xsl:with-param>
							<xsl:with-param name="searchNum">2</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">bcdefghklnpqstx34</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="marc:datafield[@tag=130]|marc:datafield[@tag=730]|marc:datafield[@tag=240]">
				<tr>
					<th scope="row">통일서명</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=130]">
							<xsl:call-template name="subfieldSelectLink130">
								<xsl:with-param name="codes">anpl</xsl:with-param>
								<xsl:with-param name="links">ap</xsl:with-param>
								<xsl:with-param name="name">통일서명</xsl:with-param>
								<xsl:with-param name="searchNum">1</xsl:with-param>
							</xsl:call-template>
							<br/>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag=730]">
							<xsl:call-template name="subfieldSelectLink130">
								<xsl:with-param name="codes">anpl</xsl:with-param>
								<xsl:with-param name="links">ap</xsl:with-param>
								<xsl:with-param name="name">통일서명</xsl:with-param>
								<xsl:with-param name="searchNum">1</xsl:with-param>
							</xsl:call-template>
							<br/>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag=240]">
							<xsl:call-template name="subfieldSelectLink130">
								<xsl:with-param name="codes">anpl</xsl:with-param>
								<xsl:with-param name="links">ap</xsl:with-param>
								<xsl:with-param name="name">통일서명</xsl:with-param>
								<xsl:with-param name="searchNum">1</xsl:with-param>
							</xsl:call-template>
							<br/>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="marc:datafield[@tag=243]">
				<tr>
					<th scope="row">통일서명</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=243]">
							<xsl:call-template name="subfieldSelectLink">
								<xsl:with-param name="codes">ap</xsl:with-param>
								<xsl:with-param name="name">통일서명</xsl:with-param>
								<xsl:with-param name="searchNum">1</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">dfghklmnors</xsl:with-param>
							</xsl:call-template>
							<br/>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="marc:datafield[@tag=600]">
			<tr>
				<th scope="row">주제명(개인명)</th>
				<td>
                    <xsl:for-each select="marc:datafield[@tag=600]">
                        <xsl:call-template name="subfieldSelectLink700">
                            <xsl:with-param name="codes">abct</xsl:with-param>
                            <xsl:with-param name="name">주제명(개인명)</xsl:with-param>
                            <xsl:with-param name="searchNum">4</xsl:with-param>
                            <xsl:with-param name="delimeter"><xsl:text> -- </xsl:text></xsl:with-param>
                        </xsl:call-template>
                        <xsl:call-template name="subfieldSelect">
                        	<xsl:with-param name="delimeter"><xsl:text> -- </xsl:text></xsl:with-param>
                            <xsl:with-param name="codes">defghjklmnopqrsuvxyz234</xsl:with-param>
                        </xsl:call-template>
                        <br/>
                    </xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=610]">
			<tr>
				<th scope="row">주제명(단체명)</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=610]">
						<xsl:call-template name="subfieldSelectLinkAuthor">
							<xsl:with-param name="codes">abtx</xsl:with-param>
							<xsl:with-param name="links">abt</xsl:with-param>
							<xsl:with-param name="name">주제명(단체명)</xsl:with-param>
							<xsl:with-param name="searchMethod">FRNT</xsl:with-param>
							<xsl:with-param name="searchNum">4</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> --</xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=611]">
			<tr>
				<th scope="row">주제명(회의명)</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=611]">
						<xsl:call-template name="subfieldSelectLink">
							<xsl:with-param name="codes">a</xsl:with-param>
							<xsl:with-param name="name">주제명(회의명)</xsl:with-param>
							<xsl:with-param name="searchNum">4</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">bcdefghklmnoprstuvxyz234</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=630]">
			<tr>
				<th scope="row">주제명<br/>(통일서명)</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=630]">
						<xsl:call-template name="subfieldSelectLink">
							<xsl:with-param name="codes">ax</xsl:with-param>
							<xsl:with-param name="name">주제명(통일서명)</xsl:with-param>
							<xsl:with-param name="searchNum">4</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> --</xsl:text></xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">dfghklmnoprstvyz23</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=651]">
			<tr>
				<th scope="row">주제명(지명)</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=651]">
						<xsl:call-template name="subfieldSelectLink700">
							<xsl:with-param name="codes">axyzv23</xsl:with-param>
							<xsl:with-param name="name">주제명(지명)</xsl:with-param>
							<xsl:with-param name="searchNum">4</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> --</xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=650]">
			<tr>
				<th scope="row">일반주제명</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=650]">
						<xsl:call-template name="subfieldSelectLink700">
							<xsl:with-param name="codes">axyzv</xsl:with-param>
							<xsl:with-param name="name">일반주제명</xsl:with-param>
							<xsl:with-param name="searchNum">4</xsl:with-param>
							<xsl:with-param name="delimeter"><xsl:text> --</xsl:text></xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=653]">
			<tr>
				<th scope="row">비통제주제어</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=653]">
						<xsl:call-template name="subfieldSelectLink">
							<xsl:with-param name="codes">a</xsl:with-param>
							<xsl:with-param name="name">비통제주제어</xsl:with-param>
							<xsl:with-param name="searchNum">4</xsl:with-param>
							<xsl:with-param name="delimeter">,</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=753]">
			<tr>
				<th scope="row">컴퓨터파일시스템세목</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=753]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abc</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="$marctype=&apos;c&apos;">
			<xsl:if test="marc:datafield[@tag=256]|marc:datafield[@tag=516]">
				<tr>
					<th scope="row">파일특성</th>
					<td>
						<xsl:for-each select="marc:datafield[@tag=256]|marc:datafield[@tag=516]">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">a</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=355]">
			<tr>
				<th scope="row">보안분류</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=355]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abcdf</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=225]">
			<tr>
				<th scope="row">축척</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=225]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">ab</xsl:with-param>
						</xsl:call-template>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
        <xsl:if test="marc:datafield[@tag=090]">
            <tr>
                <th scope="row">분류기호</th>
                <td>
                    <xsl:for-each select="marc:datafield[@tag=090]">
                        <xsl:call-template name="subfieldSelectLink">
                            <xsl:with-param name="name">분류기호</xsl:with-param>
                            <xsl:with-param name="searchNum">12</xsl:with-param>
                            <xsl:with-param name="codes">a</xsl:with-param>
                            <xsl:with-param name="delimeter"><xsl:text> </xsl:text></xsl:with-param>
                        </xsl:call-template>
                        <br/>
                    </xsl:for-each>
                </td>
            </tr>
        </xsl:if>
		<xsl:if test="marc:datafield[@tag=852 and @ind1='1']">
			<tr>
				<th scope="row">분류기호</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=852]">
						<xsl:call-template name="subfieldSelectLink">
							<xsl:with-param name="codes">h</xsl:with-param>
							<xsl:with-param name="name">분류기호</xsl:with-param>
							<xsl:with-param name="searchNum">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>		
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=546]|marc:controlfield[@tag=008]">
			<tr>
				<th scope="row">언어</th>
				<td>
					<xsl:variable name="text546" select="marc:datafield[@tag=546]"/>
					<xsl:for-each select="marc:datafield[@tag=546]">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">3ab</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="string-length($text546) = 0">
					<xsl:variable name="var" select="marc:controlfield[@tag=008]"/>
					<xsl:variable name="var1" select="substring($var,36,3)"/>
					<xsl:choose>
						<xsl:when test="$var1=&apos;amh&apos;">암하란어</xsl:when>
						<xsl:when test="$var1=&apos;ara&apos;">아라비아어</xsl:when>
						<xsl:when test="$var1=&apos;chi&apos;">중국어</xsl:when>
						<xsl:when test="$var1=&apos;dan&apos;">덴마크어</xsl:when>
						<xsl:when test="$var1=&apos;dra&apos;">드라비다어</xsl:when>
						<xsl:when test="$var1=&apos;dut&apos;">네덜란드어</xsl:when>
						<xsl:when test="$var1=&apos;egy&apos;">이집트어</xsl:when>
						<xsl:when test="$var1=&apos;eng&apos;">영어</xsl:when>
						<xsl:when test="$var1=&apos;enm&apos;">중세영어(ca. 1100-1500)</xsl:when>
						<xsl:when test="$var1=&apos;esk&apos;">에스키모어</xsl:when>
						<xsl:when test="$var1=&apos;esp&apos;">에스페란토어</xsl:when>
						<xsl:when test="$var1=&apos;eth&apos;">이디오피아어</xsl:when>
						<xsl:when test="$var1=&apos;fre&apos;">프랑스어</xsl:when>
						<xsl:when test="$var1=&apos;frm&apos;">중세프랑스어(ca. 1400-1600)</xsl:when>
						<xsl:when test="$var1=&apos;fro&apos;">고대프랑스어(ca. 842-1500)</xsl:when>
						<xsl:when test="$var1=&apos;ger&apos;">독일어</xsl:when>
						<xsl:when test="$var1=&apos;grc&apos;">고대그리스어(1453년까지)</xsl:when>
						<xsl:when test="$var1=&apos;gre&apos;">그리스어(1453년 이후)</xsl:when>
						<xsl:when test="$var1=&apos;haw&apos;">하와이어</xsl:when>
						<xsl:when test="$var1=&apos;heb&apos;">히브리어</xsl:when>
						<xsl:when test="$var1=&apos;hun&apos;">헝가리어</xsl:when>
						<xsl:when test="$var1=&apos;ind&apos;">인도네시아어</xsl:when>
						<xsl:when test="$var1=&apos;ine&apos;">인도유럽어</xsl:when>
						<xsl:when test="$var1=&apos;ira&apos;">이란어</xsl:when>
						<xsl:when test="$var1=&apos;iri&apos;">아일랜드어</xsl:when>
						<xsl:when test="$var1=&apos;ita&apos;">이탈리아어</xsl:when>
						<xsl:when test="$var1=&apos;jpn&apos;">일본어</xsl:when>
						<xsl:when test="$var1=&apos;kon&apos;">콩고어</xsl:when>
						<xsl:when test="$var1=&apos;kor&apos;">한국어</xsl:when>
						<xsl:when test="$var1=&apos;mul&apos;">다수언어</xsl:when>
						<xsl:when test="$var1=&apos;nep&apos;">네팔어</xsl:when>
						<xsl:when test="$var1=&apos;peo&apos;">고대페르시아어</xsl:when>
						<xsl:when test="$var1=&apos;per&apos;">페르시아어</xsl:when>
						<xsl:when test="$var1=&apos;pol&apos;">폴란드어</xsl:when>
						<xsl:when test="$var1=&apos;por&apos;">포루투칼어</xsl:when>
						<xsl:when test="$var1=&apos;roa&apos;">로망스어</xsl:when>
						<xsl:when test="$var1=&apos;roh&apos;">래트로만어</xsl:when>
						<xsl:when test="$var1=&apos;rom&apos;">집시어</xsl:when>
						<xsl:when test="$var1=&apos;rum&apos;">루마니아어</xsl:when>
						<xsl:when test="$var1=&apos;rus&apos;">러시아어</xsl:when>
						<xsl:when test="$var1=&apos;spa&apos;">스페인어</xsl:when>
						<xsl:when test="$var1=&apos;tag&apos;">타갈로그어</xsl:when>
						<xsl:when test="$var1=&apos;tur&apos;">터어키어</xsl:when>
						<xsl:when test="$var1=&apos;und&apos;">미상</xsl:when>
						<xsl:when test="$var1=&apos;vie&apos;">베트남어</xsl:when>
                        <xsl:otherwise><xsl:value-of select="$var1"/></xsl:otherwise>
					</xsl:choose>
					</xsl:if>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="marc:datafield[@tag=856]">
			<tr>
				<th scope="row">바로가기</th>
				<td>
					<xsl:for-each select="marc:datafield[@tag=856]">
						<xsl:call-template name="subfieldSelectLink856">
							<xsl:with-param name="codes">u</xsl:with-param>
							<xsl:with-param name="codes2">z</xsl:with-param>
							<xsl:with-param name="name">바로가기</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>