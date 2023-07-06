ÌE
vC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Controllers\Api\StudentsController.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Controllers& 1
.1 2
Api2 5
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
StudentsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IStudentRepository +
_studentRepository, >
;> ?
private 
readonly 
IMapper  
_mapper! (
;( )
public 
StudentsController !
(! "
IStudentRepository" 4
studentRepository5 F
,F G
IMapperH O
mapperP V
)V W
{ 	
_studentRepository 
=  
studentRepository! 2
;2 3
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3

StudentDto3 =
>= >
>> ?
>? @
GetStudentsAsyncA Q
(Q R
)R S
{ 	
var 
studentList 
= 
await #
_studentRepository$ 6
.6 7
GetAllStudentAsync7 I
(I J
)J K
;K L
if
 
( 
studentList 
== 
null !
)! "
{
 
return 
NotFound 
( 
$str <
)< =
;= >
}
 
return   
Ok   
(   
_mapper   
.   
Map   !
<  ! "
IEnumerable  " -
<  - .

StudentDto  . 8
>  8 9
>  9 :
(  : ;
studentList  ; F
)  F G
)  G H
;  H I
}!! 	
[$$ 	
HttpGet$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
ActionResult%% &
<%%& '

StudentDto%%' 1
>%%1 2
>%%2 3
GetStudentAsync%%4 C
(%%C D
int%%D G
id%%H J
)%%J K
{&& 	
var'' 
student'' 
='' 
await'' 
_studentRepository''  2
.''2 3
GetStudentAsync''3 B
(''B C
id''C E
)''E F
;''F G
if(( 
((( 
student(( 
.(( 
Id(( 
==(( 
$num(( 
&&(( !
student((" )
.(() *
Name((* .
==((/ 1
$str((2 4
&&((5 7
student((8 ?
.((? @
DepartmentId((@ L
==((M O
$num((P Q
&&((R T
student((U \
.((\ ]
BookId((] c
==((d f
$num((g h
)((i j
{)) 
return** 
NotFound** 
(**  
$str**  F
)**F G
;**G H
}++ 
return-- 
Ok-- 
(-- 
_mapper-- 
.-- 
Map-- !
<--! "

StudentDto--" ,
>--, -
(--- .
student--. 5
)--5 6
)--6 7
;--7 8
}.. 	
[00 	
HttpGet00	 
(00 
$str00 
)00 
]00 
public11 
async11 
Task11 
<11 
ActionResult11 &
<11& '
IEnumerable11' 2
<112 3
BookDto113 :
>11: ;
>11; <
>11< =
GetBooksAsync11> K
(11K L
)11L M
{22 	
var33 
books33 
=33 
await33 
_studentRepository33 0
.330 1
GetBookAsync331 =
(33= >
)33> ?
;33? @
return44 
Ok44 
(44 
_mapper44 
.44 
Map44 !
<44! "
IEnumerable44" -
<44- .
BookDto44. 5
>445 6
>446 7
(447 8
books448 =
)44= >
)44> ?
;44? @
}55 	
[77 	
HttpGet77	 
(77 
$str77 
)77 
]77  
public88 
async88 
Task88 
<88 
ActionResult88 &
<88& '
IEnumerable88' 2
<882 3
BookDto883 :
>88: ;
>88; <
>88< =
GetDepartmentsAsync88> Q
(88Q R
)88R S
{99 	
var:: 
departments:: 
=:: 
await:: #
_studentRepository::$ 6
.::6 7
GetDepartmentAsync::7 I
(::I J
)::J K
;::K L
return;; 
Ok;; 
(;; 
_mapper;; 
.;; 
Map;; !
<;;! "
IEnumerable;;" -
<;;- .
DepartmentDto;;. ;
>;;; <
>;;< =
(;;= >
departments;;> I
);;I J
);;J K
;;;K L
}<< 	
[?? 	
HttpPut??	 
(?? 
$str?? 
)?? 
]?? 
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (
UpdateStudentAsync@@) ;
(@@; <
int@@< ?
id@@@ B
,@@B C
[@@D E
FromBody@@E M
]@@M N

StudentDto@@N X

studentdto@@Y c
)@@c d
{AA 	
ifCC 
(CC 
idCC 
!=CC 

studentdtoCC  
.CC  !
IdCC! #
)CC# $
{DD 
returnEE 

BadRequestEE !
(EE! "
$strEE" N
)EEN O
;EEO P
}FF 
awaitGG 
_studentRepositoryGG $
.GG$ %
UpdateStudentAsyncGG% 7
(GG7 8
_mapperGG8 ?
.GG? @
MapGG@ C
<GGC D
StudentGGD K
>GGK L
(GGL M

studentdtoGGM W
)GGW X
)GGX Y
;GGY Z
returnHH 
OkHH 
(HH 
)HH 
;HH 
}II 	
[LL 	
HttpPostLL	 
]LL 
publicMM 
asyncMM 
TaskMM 
<MM 
ActionResultMM &
<MM& '
StudentMM' .
>MM. /
>MM/ 0
AddStudentAsyncMM1 @
(MM@ A
[MMA B
FromBodyMMB J
]MMJ K

StudentDtoMMK U

studentdtoMMV `
)MM` a
{NN 	
varOO 
resultOO 
=OO 
awaitOO 
_studentRepositoryOO 1
.OO1 2
AddStudentAsyncOO2 A
(OOA B
_mapperOOB I
.OOI J
MapOOJ M
<OOM N
StudentOON U
>OOU V
(OOV W

studentdtoOOW a
)OOa b
)OOb c
;OOc d
ifPP 
(PP 
resultPP 
==PP 
$strPP 
)PP 
{QQ 
returnRR 
OkRR 
(RR 
$strRR 6
)RR6 7
;RR7 8
}SS 
elseTT 
{UU 
returnVV 
ProblemVV 
(VV 
resultVV %
)VV% &
;VV& '
}WW 
}XX 	
[[[ 	

HttpDelete[[	 
([[ 
$str[[ 
)[[ 
][[ 
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
DeleteStudentAsync\\) ;
(\\; <
int\\< ?
id\\@ B
)\\B C
{]] 	
var^^ 
student^^ 
=^^ 
await^^ 
_studentRepository^^  2
.^^2 3
GetStudentAsync^^3 B
(^^B C
id^^C E
)^^E F
;^^F G
if__ 
(__ 
student__ 
==__ 
null__ 
)__  
{`` 
returnaa 
NotFoundaa 
(aa  
$straa  F
)aaF G
;aaG H
}bb 
awaitcc 
_studentRepositorycc $
.cc$ %
RemoveStudentAsynccc% 7
(cc7 8
_mappercc8 ?
.cc? @
Mapcc@ C
<ccC D
StudentccD K
>ccK L
(ccL M
studentccM T
)ccT U
)ccU V
;ccV W
returndd 
Okdd 
(dd 
$strdd >
)dd> ?
;dd? @
}ee 	
}ff 
}gg ì
nC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Controllers\HomeController.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Controllers& 1
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
public		 
IActionResult		 
Index		 "
(		" #
)		# $
{

 	
return 
View 
( 
) 
; 
} 	
[ 	
ResponseCache	 
( 
Duration 
=  !
$num" #
,# $
Location% -
=. /!
ResponseCacheLocation0 E
.E F
NoneF J
,J K
NoStoreL S
=T U
trueV Z
)Z [
][ \
public 
IActionResult 
Error "
(" #
)# $
{ 	
return 
View 
( 
new 
ErrorViewModel *
{+ ,
	RequestId- 6
=7 8
Activity9 A
.A B
CurrentB I
?I J
.J K
IdK M
??N P
HttpContextQ \
.\ ]
TraceIdentifier] l
}m n
)n o
;o p
} 	
} 
} °p
qC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Controllers\StudentController.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Controllers& 1
{ 
public 

class 
StudentController "
:# $

Controller% /
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
string 
url  #
=$ %
string& ,
., -
Empty- 2
;2 3
public 
StudentController  
(  !

HttpClient! +

httpClient, 6
,6 7
IConfiguration8 F
configurationG T
)T U
{ 	
_httpClient 
= 

httpClient $
;$ %
_configuration 
= 
configuration *
;* +
url 
= 
_configuration  
.  !
GetValue! )
<) *
string* 0
>0 1
(1 2
$str2 @
)@ A
!A B
;B C
} 	
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
Index"") .
("". /
)""/ 0
{## 	
List$$ 
<$$ 

StudentDto$$ 
>$$ 
?$$ 
studentList$$ )
=$$* +
new$$, /
List$$0 4
<$$4 5

StudentDto$$5 ?
>$$? @
($$@ A
)$$A B
;$$B C
using&& 
(&& 
var&& 
response&& 
=&&  !
await&&" '
_httpClient&&( 3
.&&3 4
GetAsync&&4 <
(&&< =
url&&= @
)&&@ A
)&&A B
{'' 
string(( 
apiResponse(( "
=((# $
await((% *
response((+ 3
.((3 4
Content((4 ;
.((; <
ReadAsStringAsync((< M
(((M N
)((N O
;((O P
if)) 
()) 
response)) 
.)) 
IsSuccessStatusCode)) /
)))/ 0
{** 
studentList++ 
=++  !
JsonConvert++" -
.++- .
DeserializeObject++. ?
<++? @
List++@ D
<++D E

StudentDto++E O
>++O P
>++P Q
(++Q R
apiResponse++R ]
)++] ^
;++^ _
},, 
}-- 
return.. 
View.. 
(.. 
studentList.. #
)..# $
;..$ %
}// 	
[22 	
HttpGet22	 
]22 
public33 
async33 
Task33 
<33 
IActionResult33 '
>33' (
Create33) /
(33/ 0
)330 1
{44 	
List55 
<55 
BookDto55 
>55 
?55 
bookList55 #
;55# $
List66 
<66 
DepartmentDto66 
>66 
?66  
departmentList66! /
;66/ 0
using77 
(77 
var77 
response77 
=77  !
await77" '
_httpClient77( 3
.773 4
GetAsync774 <
(77< =
url77= @
+77@ A
$str77A I
)77I J
)77J K
{88 
string99 
apiResponse99 "
=99# $
await99% *
response99+ 3
.993 4
Content994 ;
.99; <
ReadAsStringAsync99< M
(99M N
)99N O
;99O P
if:: 
(:: 
response:: 
.:: 
IsSuccessStatusCode:: 0
)::0 1
{;; 
bookList<< 
=<< 
JsonConvert<< *
.<<* +
DeserializeObject<<+ <
<<<< =
List<<= A
<<<A B
BookDto<<B I
><<I J
><<J K
(<<K L
apiResponse<<L W
)<<W X
;<<X Y
ViewData== 
[== 
$str== %
]==% &
===' (
new==) ,

SelectList==- 7
(==7 8
bookList==8 @
,==@ A
$str==B J
,==J K
$str==L R
,==R S
$str==T a
)==a b
;==b c
}>> 
}?? 
usingAA 
(AA 
varAA 
responseAA 
=AA  !
awaitAA" '
_httpClientAA( 3
.AA3 4
GetAsyncAA4 <
(AA< =
urlAA= @
+AAA B
$strAAC Q
)AAQ R
)AAR S
{BB 
stringCC 
apiResponseCC "
=CC# $
awaitCC% *
responseCC+ 3
.CC3 4
ContentCC4 ;
.CC; <
ReadAsStringAsyncCC< M
(CCM N
)CCN O
;CCO P
ifDD 
(DD 
responseDD 
.DD 
IsSuccessStatusCodeDD 0
)DD0 1
{EE 
departmentListFF "
=FF# $
JsonConvertFF% 0
.FF0 1
DeserializeObjectFF1 B
<FFB C
ListFFC G
<FFG H
DepartmentDtoFFH U
>FFU V
>FFV W
(FFW X
apiResponseFFX c
)FFc d
;FFd e
ViewDataGG 
[GG 
$strGG %
]GG% &
=GG' (
newGG) ,

SelectListGG- 7
(GG7 8
departmentListGG8 F
,GGF G
$strGGH P
,GGP Q
$strGGR X
,GGX Y
$strGGZ m
)GGm n
;GGn o
}HH 
}II 
returnKK 
ViewKK 
(KK 
)KK 
;KK 
}LL 	
[NN 	
HttpPostNN	 
]NN 
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (
CreateOO) /
(OO/ 0

StudentDtoOO0 :

studentDtoOO; E
)OOE F
{PP 	
ifQQ 
(QQ 

ModelStateQQ 
.QQ 
IsValidQQ !
)QQ! "
{RR 
varSS 
jsonSS 
=SS 
newSS 
StringContentSS ,
(SS, -
JsonConvertSS- 8
.SS8 9
SerializeObjectSS9 H
(SSH I

studentDtoSSI S
)SSS T
,SST U
EncodingSSV ^
.SS^ _
UTF8SS_ c
,SSc d
$strSSe w
)SSw x
;SSx y
usingTT 
(TT 
varTT 
responseTT #
=TT$ %
awaitTT& +
_httpClientTT, 7
.TT7 8
	PostAsyncTT8 A
(TTA B
urlTTB E
,TTE F
jsonTTG K
)TTK L
)TTL M
{UU 
ifVV 
(VV 
responseVV  
.VV  !
IsSuccessStatusCodeVV! 4
)VV4 5
{WW 
returnXX 
RedirectToActionXX /
(XX/ 0
$strXX0 7
,XX7 8
$strXX9 B
)XXB C
;XXC D
}YY 
}ZZ 
}[[ 
return\\ 
View\\ 
(\\ 

studentDto\\ "
)\\" #
;\\# $
}]] 	
[__ 	
HttpGet__	 
]__ 
public`` 
async`` 
Task`` 
<`` 
IActionResult`` '
>``' (
Edit``) -
(``- .
int``. 1
id``2 4
)``4 5
{aa 	
Listbb 
<bb 
BookDtobb 
>bb 
?bb 
bookListbb #
;bb# $
Listcc 
<cc 
DepartmentDtocc 
>cc 
?cc  
departmentListcc! /
;cc/ 0
usingdd 
(dd 
vardd 
responsedd 
=dd  !
awaitdd" '
_httpClientdd( 3
.dd3 4
GetAsyncdd4 <
(dd< =
urldd= @
+ddA B
$strddC K
)ddK L
)ddL M
{ee 
stringff 
apiResponseff "
=ff# $
awaitff% *
responseff+ 3
.ff3 4
Contentff4 ;
.ff; <
ReadAsStringAsyncff< M
(ffM N
)ffN O
;ffO P
ifgg 
(gg 
responsegg 
.gg 
IsSuccessStatusCodegg 0
)gg0 1
{hh 
bookListii 
=ii 
JsonConvertii *
.ii* +
DeserializeObjectii+ <
<ii< =
Listii= A
<iiA B
BookDtoiiB I
>iiI J
>iiJ K
(iiK L
apiResponseiiL W
)iiW X
;iiX Y
ViewDatajj 
[jj 
$strjj %
]jj% &
=jj' (
newjj) ,

SelectListjj- 7
(jj7 8
bookListjj8 @
,jj@ A
$strjjB J
,jjJ K
$strjjL R
,jjR S
$strjjT a
)jja b
;jjb c
}kk 
}ll 
usingnn 
(nn 
varnn 
responsenn 
=nn  !
awaitnn" '
_httpClientnn( 3
.nn3 4
GetAsyncnn4 <
(nn< =
urlnn= @
+nnA B
$strnnC Q
)nnQ R
)nnR S
{oo 
stringpp 
apiResponsepp "
=pp# $
awaitpp% *
responsepp+ 3
.pp3 4
Contentpp4 ;
.pp; <
ReadAsStringAsyncpp< M
(ppM N
)ppN O
;ppO P
ifqq 
(qq 
responseqq 
.qq 
IsSuccessStatusCodeqq 0
)qq0 1
{rr 
departmentListss "
=ss# $
JsonConvertss% 0
.ss0 1
DeserializeObjectss1 B
<ssB C
ListssC G
<ssG H
DepartmentDtossH U
>ssU V
>ssV W
(ssW X
apiResponsessX c
)ssc d
;ssd e
ViewDatatt 
[tt 
$strtt %
]tt% &
=tt' (
newtt) ,

SelectListtt- 7
(tt7 8
departmentListtt8 F
,ttF G
$strttH P
,ttP Q
$strttR X
,ttX Y
$strttZ m
)ttm n
;ttn o
}uu 
}vv 
usingyy 
(yy 
varyy 
responseyy 
=yy  !
awaityy" '
_httpClientyy( 3
.yy3 4
GetAsyncyy4 <
(yy< =
urlyy= @
+yy@ A
$"yyA C
$stryyC D
{yyD E
idyyE G
}yyG H
"yyH I
)yyI J
)yyJ K
{zz 
string{{ 
apiResponse{{ "
={{# $
await{{% *
response{{+ 3
.{{3 4
Content{{4 ;
.{{; <
ReadAsStringAsync{{< M
({{M N
){{N O
;{{O P
var|| 
student|| 
=|| 
JsonConvert|| )
.||) *
DeserializeObject||* ;
<||; <

StudentDto||< F
>||F G
(||G H
apiResponse||H S
)||S T
;||T U
return}} 
View}} 
(}} 
student}} #
)}}# $
;}}$ %
}~~ 
} 	
[
ÅÅ 	
HttpPost
ÅÅ	 
]
ÅÅ 
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
IActionResult
ÇÇ '
>
ÇÇ' (
Edit
ÇÇ) -
(
ÇÇ- .

StudentDto
ÇÇ. 8

studentDto
ÇÇ9 C
)
ÇÇC D
{
ÉÉ 	
if
ÑÑ 
(
ÑÑ 

ModelState
ÑÑ 
.
ÑÑ 
IsValid
ÑÑ !
)
ÑÑ! "
{
ÖÖ 
var
ÜÜ 
json
ÜÜ 
=
ÜÜ 
new
ÜÜ 
StringContent
ÜÜ ,
(
ÜÜ, -
JsonConvert
ÜÜ- 8
.
ÜÜ8 9
SerializeObject
ÜÜ9 H
(
ÜÜH I

studentDto
ÜÜI S
)
ÜÜS T
,
ÜÜT U
Encoding
ÜÜV ^
.
ÜÜ^ _
UTF8
ÜÜ_ c
,
ÜÜc d
$str
ÜÜe w
)
ÜÜw x
;
ÜÜx y
using
áá 
(
áá 
var
áá 
response
áá #
=
áá$ %
await
áá& +
_httpClient
áá, 7
.
áá7 8
PutAsync
áá8 @
(
áá@ A
url
ááA D
+
ááE F
$"
ááG I
$str
ááI J
{
ááJ K

studentDto
ááK U
.
ááU V
Id
ááV X
}
ááX Y
"
ááY Z
,
ááZ [
json
áá\ `
)
áá` a
)
ááa b
{
àà 
if
ââ 
(
ââ 
response
ââ  
.
ââ  !!
IsSuccessStatusCode
ââ! 4
)
ââ4 5
{
ää 
return
ãã 
RedirectToAction
ãã /
(
ãã/ 0
$str
ãã0 7
,
ãã7 8
$str
ãã9 B
)
ããB C
;
ããC D
}
åå 
}
çç 
}
éé 
return
èè 
View
èè 
(
èè 

studentDto
èè "
)
èè" #
;
èè# $
}
êê 	
[
íí 	
HttpGet
íí	 
]
íí 
public
ìì 
async
ìì 
Task
ìì 
<
ìì 
IActionResult
ìì '
>
ìì' (
Delete
ìì) /
(
ìì/ 0
int
ìì0 3
id
ìì4 6
)
ìì6 7
{
îî 	
using
ïï 
(
ïï 
var
ïï 
response
ïï 
=
ïï  !
await
ïï" '
_httpClient
ïï( 3
.
ïï3 4
DeleteAsync
ïï4 ?
(
ïï? @
url
ïï@ C
+
ïïD E
$"
ïïF H
$str
ïïH I
{
ïïI J
id
ïïJ L
}
ïïL M
"
ïïM N
)
ïïN O
)
ïïO P
{
ññ 
if
óó 
(
óó 
response
óó 
.
óó !
IsSuccessStatusCode
óó 0
)
óó0 1
{
òò 
return
ôô 
RedirectToAction
ôô +
(
ôô+ ,
$str
ôô, 3
,
ôô3 4
$str
ôô5 >
)
ôô> ?
;
ôô? @
}
öö 
}
õõ 
return
úú 
View
úú 
(
úú 
)
úú 
;
úú 
}
ùù 	
}
üü 
}†† Ö
oC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Database\ApplicationContext.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Database& .
{ 
public 

class 
ApplicationContext #
:$ %
	DbContext& /
{		 
public

 
ApplicationContext

 !
(

! "
DbContextOptions

" 2
<

2 3
ApplicationContext

3 E
>

E F
options

G N
)

N O
:

P Q
base

R V
(

V W
options

W ^
)

^ _
{

` a
}

b c
public 
DbSet 
< 
Student 
> 
Students &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DbSet 
< 
Book 
> 
Books  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 

Department 
>  
Departments! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
DbSet 
< '
WebDevelopmentInSimformDemo 0
.0 1
Dto1 4
.4 5

StudentDto5 ?
>? @

StudentDtoA K
{L M
getN Q
;Q R
setS V
;V W
}X Y
=Z [
default\ c
!c d
;d e
} 
} ∂
_C:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Dto\BookDto.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Dto& )
{ 
public 

class 
BookDto 
{ 
public 
int 
BookId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
} 
} ¬
eC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Dto\DepartmentDto.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Dto& )
{ 
public 

class 
DepartmentDto 
{ 
public 
int 
DeptId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
} 
} Ù
bC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Dto\StudentDto.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Dto& )
{ 
public 

class 

StudentDto 
{ 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
=

) *
string

+ 1
.

1 2
Empty

2 7
;

7 8
[ 	
Display	 
( 
Name 
= 
$str "
)" #
]# $
public 
int 
DepartmentId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
virtual 

Department !
?! "

Department# -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
[ 	
Display	 
( 
Name 
= 
$str 
) 
]  
public 
int 
BookId 
{ 
get 
;  
set! $
;$ %
}& '
public 
virtual 
Book 
? 
Book !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ®
pC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Interface\IStudentRepository.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
	Interface& /
{ 
public 

	interface 
IStudentRepository '
{ 
Task 
< 
string 
> 
AddStudentAsync $
($ %
Student% ,
student- 4
)4 5
;5 6
Task 
RemoveStudentAsync 
(  
Student  '
student( /
)/ 0
;0 1
Task		 
UpdateStudentAsync		 
(		  
Student		  '
student		( /
)		/ 0
;		0 1
Task

 
<

 
IEnumerable

 
<

 
Student

  
>

  !
>

! "
GetAllStudentAsync

# 5
(

5 6
)

6 7
;

7 8
Task 
< 
Student 
> 
GetStudentAsync %
(% &
int& )
id* ,
), -
;- .
Task 
< 
IEnumerable 
< 
Book 
> 
> 
GetBookAsync  ,
(, -
)- .
;. /
Task 
< 
IEnumerable 
< 

Department #
># $
>$ %
GetDepartmentAsync& 8
(8 9
)9 :
;: ;
} 
} Ã
jC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Mapping\MappingProfile.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
MappingProfile& 4
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public		 
MappingProfile		 
(		 
)		 
{

 	
	CreateMap 
< 

StudentDto  
,  !
Student# *
>* +
(+ ,
), -
. 
	ForMember 
( 
std 
=>  
std  #
.# $
Book$ (
,( )
opt* -
=>. 0
opt1 4
.4 5
Ignore5 ;
(; <
)< =
)= >
. 
	ForMember 
( 
std 
=>  
std  #
.# $

Department$ .
,. /
opt0 3
=>4 6
opt7 :
.: ;
Ignore; A
(A B
)B C
)C D
;D E
	CreateMap 
< 
Student 
, 

StudentDto (
>( )
() *
)* +
;+ ,
	CreateMap 
< 
BookDto 
, 
Book #
># $
($ %
)% &
;& '
	CreateMap 
< 
Book 
, 
BookDto #
># $
($ %
)% &
;& '
	CreateMap 
< 
DepartmentDto #
,# $

Department% /
>/ 0
(0 1
)1 2
;2 3
	CreateMap 
< 

Department  
,  !
DepartmentDto" /
>/ 0
(0 1
)1 2
;2 3
} 	
} 
} ı;
{C:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Migrations\20230705091834_IntialContext.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &

Migrations& 0
{ 
public 

partial 
class 
IntialContext &
:' (
	Migration) 2
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
BookId 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
falseQ V
)V W
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
BookId8 >
)> ?
;? @
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
DeptId 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Name   
=   
table    
.    !
Column  ! '
<  ' (
string  ( .
>  . /
(  / 0
type  0 4
:  4 5
$str  6 E
,  E F
nullable  G O
:  O P
false  Q V
)  V W
}!! 
,!! 
constraints"" 
:"" 
table"" "
=>""# %
{## 
table$$ 
.$$ 

PrimaryKey$$ $
($$$ %
$str$$% 5
,$$5 6
x$$7 8
=>$$9 ;
x$$< =
.$$= >
DeptId$$> D
)$$D E
;$$E F
}%% 
)%% 
;%% 
migrationBuilder'' 
.'' 
CreateTable'' (
(''( )
name(( 
:(( 
$str((  
,((  !
columns)) 
:)) 
table)) 
=>)) !
new))" %
{** 
Id++ 
=++ 
table++ 
.++ 
Column++ %
<++% &
int++& )
>++) *
(++* +
type+++ /
:++/ 0
$str++1 6
,++6 7
nullable++8 @
:++@ A
false++B G
)++G H
.,, 

Annotation,, #
(,,# $
$str,,$ 8
,,,8 9
$str,,: @
),,@ A
,,,A B
Name-- 
=-- 
table--  
.--  !
Column--! '
<--' (
string--( .
>--. /
(--/ 0
type--0 4
:--4 5
$str--6 E
,--E F
nullable--G O
:--O P
false--Q V
)--V W
,--W X
DepartmentId..  
=..! "
table..# (
...( )
Column..) /
<../ 0
int..0 3
>..3 4
(..4 5
type..5 9
:..9 :
$str..; @
,..@ A
nullable..B J
:..J K
false..L Q
)..Q R
,..R S
BookId// 
=// 
table// "
.//" #
Column//# )
<//) *
int//* -
>//- .
(//. /
type/// 3
://3 4
$str//5 :
,//: ;
nullable//< D
://D E
false//F K
)//K L
}00 
,00 
constraints11 
:11 
table11 "
=>11# %
{22 
table33 
.33 

PrimaryKey33 $
(33$ %
$str33% 2
,332 3
x334 5
=>336 8
x339 :
.33: ;
Id33; =
)33= >
;33> ?
table44 
.44 

ForeignKey44 $
(44$ %
name55 
:55 
$str55 8
,558 9
column66 
:66 
x66  !
=>66" $
x66% &
.66& '
BookId66' -
,66- .
principalTable77 &
:77& '
$str77( /
,77/ 0
principalColumn88 '
:88' (
$str88) 1
,881 2
onDelete99  
:99  !
ReferentialAction99" 3
.993 4
Cascade994 ;
)99; <
;99< =
table:: 
.:: 

ForeignKey:: $
(::$ %
name;; 
:;; 
$str;; D
,;;D E
column<< 
:<< 
x<<  !
=><<" $
x<<% &
.<<& '
DepartmentId<<' 3
,<<3 4
principalTable== &
:==& '
$str==( 5
,==5 6
principalColumn>> '
:>>' (
$str>>) 1
,>>1 2
onDelete??  
:??  !
ReferentialAction??" 3
.??3 4
Cascade??4 ;
)??; <
;??< =
}@@ 
)@@ 
;@@ 
migrationBuilderBB 
.BB 
CreateIndexBB (
(BB( )
nameCC 
:CC 
$strCC *
,CC* +
tableDD 
:DD 
$strDD !
,DD! "
columnEE 
:EE 
$strEE  
)EE  !
;EE! "
migrationBuilderGG 
.GG 
CreateIndexGG (
(GG( )
nameHH 
:HH 
$strHH 0
,HH0 1
tableII 
:II 
$strII !
,II! "
columnJJ 
:JJ 
$strJJ &
)JJ& '
;JJ' (
}KK 	
	protectedNN 
overrideNN 
voidNN 
DownNN  $
(NN$ %
MigrationBuilderNN% 5
migrationBuilderNN6 F
)NNF G
{OO 	
migrationBuilderPP 
.PP 
	DropTablePP &
(PP& '
nameQQ 
:QQ 
$strQQ  
)QQ  !
;QQ! "
migrationBuilderSS 
.SS 
	DropTableSS &
(SS& '
nameTT 
:TT 
$strTT 
)TT 
;TT 
migrationBuilderVV 
.VV 
	DropTableVV &
(VV& '
nameWW 
:WW 
$strWW #
)WW# $
;WW$ %
}XX 	
}YY 
}ZZ Â
_C:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Models\Book.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Models& ,
{ 
public 

class 
Book 
{ 
[ 	
Key	 
] 
public 
int 
BookId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
}

 
} Ò
eC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Models\Department.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Models& ,
{ 
public 

class 

Department 
{ 
[ 	
Key	 
] 
public 
int 
DeptId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
} 
} ’
iC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Models\ErrorViewModel.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Models& ,
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
? 
	RequestId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
} 
}		 Á
bC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Models\Student.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &
Models& ,
{ 
public 

class 
Student 
{ 
[ 	
Key	 
] 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
=

) *
string

+ 1
.

1 2
Empty

2 7
;

7 8
[ 	

ForeignKey	 
( 
$str "
)" #
]# $
public 
int 
DepartmentId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
virtual 

Department !
?! "

Department# -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
[ 	

ForeignKey	 
( 
$str 
) 
] 
public 
int 
BookId 
{ 
get 
;  
set! $
;$ %
}& '
public 
virtual 
Book 
? 
Book !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ›
[C:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Program.cs
var		 
builder		 
=		 
WebApplication		 
.		 
CreateBuilder		 *
(		* +
args		+ /
)		/ 0
;		0 1
builder 
. 
Services 
. #
AddControllersWithViews (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddDbContext 
< 
ApplicationContext 0
>0 1
(1 2
options2 9
=>: <
options= D
.D E
UseSqlServerE Q
(Q R
builderR Y
.Y Z
ConfigurationZ g
.g h
GetConnectionStringh {
({ |
$str	| ê
)
ê ë
)
ë í
)
í ì
;
ì î
builder 
. 
Services 
. 
	AddScoped 
< 
IStudentRepository -
,- .
StudentRepository/ @
>@ A
(A B
)B C
;C D
builder 
. 
Services 
. 
AddAutoMapper 
( 
cfg "
=># %
cfg& )
.) *

AddProfile* 4
<4 5
MappingProfile5 C
>C D
(D E
)E F
)F G
;G H
builder 
. 
Services 
. 
AddHttpClient 
< 
StudentController 0
>0 1
(1 2
)2 3
;3 4
Log 
. 
Logger 

= 
new 
LoggerConfiguration $
($ %
)% &
. 
MinimumLevel 
. 
Information 
( 
) 
. 
WriteTo 
. 
File 
( 
builder 
. 
Configuration (
.( )
GetValue) 1
<1 2
string2 8
>8 9
(9 :
$str: I
)I J
!J K
,K L
rollingIntervalM \
:] ^
RollingInterval^ m
.m n
Dayn q
)q r
. 
CreateLogger 
( 
) 
; 
builder 
. 
Host 
. 

UseSerilog 
( 
) 
; 
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
! 
app 
. 	
Environment	 
. 
IsDevelopment "
(" #
)# $
)$ %
{ 
app 
. 
UseExceptionHandler 
( 
$str )
)) *
;* +
app   
.   
UseHsts   
(   
)   
;   
}!! 
app## 
.## 
UseHttpsRedirection## 
(## 
)## 
;## 
app$$ 
.$$ 
UseStaticFiles$$ 
($$ 
)$$ 
;$$ 
app&& 
.&& 

UseRouting&& 
(&& 
)&& 
;&& 
app(( 
.(( 
UseAuthorization(( 
((( 
)(( 
;(( 
app** 
.** 
MapControllerRoute** 
(** 
name++ 
:++ 	
$str++
 
,++ 
pattern,, 
:,, 
$str,, 5
),,5 6
;,,6 7
app.. 
... 
Run.. 
(.. 
).. 	
;..	 
ò0
pC:\Users\install\Desktop\WebDevelopmentInSimformDemo\WebDevelopmentInSimformDemo\Repository\StudentRepository.cs
	namespace 	'
WebDevelopmentInSimformDemo
 %
.% &

Repository& 0
{ 
public		 

class		 
StudentRepository		 "
:		# $
IStudentRepository		% 7
{

 
private 
readonly 
ApplicationContext +
_context, 4
;4 5
public 
StudentRepository  
(  !
ApplicationContext! 3
context4 ;
); <
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
string  
>  !
AddStudentAsync" 1
(1 2
Student2 9
student: A
)A B
{ 	
await 
_context 
. 
Students #
.# $
AddAsync$ ,
(, -
student- 4
)4 5
;5 6
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
$str 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Student& -
>- .
>. /
GetAllStudentAsync0 B
(B C
)C D
{ 	
return 
await 
_context !
.! "
Students" *
.* +
Include+ 2
(2 3
$str3 9
)9 :
.: ;
Include; B
(B C
$strC O
)O P
.P Q
ToListAsyncQ \
(\ ]
)] ^
;^ _
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Book& *
>* +
>+ ,
GetBookAsync- 9
(9 :
): ;
{ 	
return 
await 
_context !
.! "
Books" '
.' (
ToListAsync( 3
(3 4
)4 5
;5 6
}   	
public"" 
async"" 
Task"" 
<"" 
IEnumerable"" %
<""% &

Department""& 0
>""0 1
>""1 2
GetDepartmentAsync""3 E
(""E F
)""F G
{## 	
return$$ 
await$$ 
_context$$ !
.$$! "
Departments$$" -
.$$- .
ToListAsync$$. 9
($$9 :
)$$: ;
;$$; <
}%% 	
public'' 
async'' 
Task'' 
<'' 
Student'' !
>''! "
GetStudentAsync''# 2
(''2 3
int''3 6
id''7 9
)''9 :
{(( 	
return)) 
await)) 
_context)) !
.))! "
Students))" *
.))* +
Where))+ 0
())0 1
std))1 4
=>))5 7
std))8 ;
.)); <
Id))< >
==))? A
id))B D
)))D E
.))E F
FirstOrDefaultAsync))F Y
())Y Z
)))Z [
??))\ ^
new))_ b
Student))c j
())j k
)))k l
;))l m
}** 	
public,, 
async,, 
Task,, 
RemoveStudentAsync,, ,
(,,, -
Student,,- 4
student,,5 <
),,< =
{-- 	
var.. 
studentToRemove.. 
=..  
await..! &
GetStudentAsync..' 6
(..6 7
student..7 >
...> ?
Id..? A
)..A B
;..B C
if// 
(// 
studentToRemove// 
!=// !
null//" &
)//& '
{00 
await11 
_context11 
.11  
Students11  (
.11( )
Where11) .
(11. /
std11/ 2
=>112 4
std114 7
.117 8
Id118 :
==11; =
student11> E
.11E F
Id11F H
)11H I
.11I J
ExecuteDeleteAsync11J \
(11\ ]
)11] ^
;11^ _
}22 
}33 	
public55 
async55 
Task55 
UpdateStudentAsync55 ,
(55, -
Student55- 4
student555 <
)55< =
{66 	
var77 
studentToUpdate77 
=77  !
await77" '
GetStudentAsync77( 7
(777 8
student778 ?
.77? @
Id77@ B
)77B C
;77C D
if88 
(88 
studentToUpdate88 
!=88 !
null88" &
)88& '
{99 
await:: 
_context:: 
.:: 
Students:: '
.::' (
Where::( -
(::- .
std::. 1
=>::2 4
std::5 8
.::8 9
Id::9 ;
==::< >
student::? F
.::F G
Id::G I
)::I J
.::J K
ExecuteUpdateAsync::K ]
(::] ^
std::^ a
=>::b d
std::e h
.::h i
SetProperty::i t
(::t u
s::u v
=>::w y
s::z {
.::{ |
Name	::| Ä
,
::Å Ç
s
::É Ñ
=>
::Ñ Ü
student
::Ü ç
.
::ç é
Name
::é í
)
::í ì
.;; 
SetProperty;; 
(;; 
s;; 
=>;; !
s;;" #
.;;# $
DepartmentId;;$ 0
,;;0 1
s;;2 3
=>;;4 6
student;;7 >
.;;> ?
DepartmentId;;? K
);;K L
.<< 
SetProperty<< 
(<< 
s<< 
=><< !
s<<" #
.<<# $
BookId<<$ *
,<<* +
s<<, -
=><<. 0
student<<1 8
.<<8 9
BookId<<9 ?
)<<? @
)== 
;== 
}>> 
}?? 	
}@@ 
}AA 