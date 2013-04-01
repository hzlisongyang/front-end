<%
Function QueryToJSON(dbc, sql)
        Dim rs, jsa
        Set rs = dbc.Execute(sql)
        Set jsa = jsArray()
        While Not (rs.EOF Or rs.BOF)
                Set jsa(Null) = jsObject()
                For Each col In rs.Fields
						if col.Name="score" then
							score=0
							count=0
							sqlTemp="select score from elective where score>0 and xkid='"&col.value&"'"
							Set RsTemp =conn.execute(sqlTemp)
							if not RsTemp.EOF and not RsTemp.BOF then
								Do while Not RsTemp.EOF 
									 For each y in RsTemp.fields
										  score=score+y.value
										  count=count+1
									 Next
								RsTemp.MoveNext 
								loop	
							end if
							if count=0 then
									count=1
							end if
	
							jsa(Null)(col.Name) = score/count
						else
                        jsa(Null)(col.Name) = col.Value
						end if
                Next
        rs.MoveNext
        Wend
        Set QueryToJSON = jsa
End Function
%>