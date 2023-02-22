--https://www.sqlshack.com/use-hierarchyid-sql-server/
;with base as 
(select OrgUnit = cast(OrgUnit as varchar(max)), 
		 ParentOrgUnit = cast(ParentOrgUnit as varchar(max)) from UMOJA_EXTRACT..vw_UmojaExtractOrgUnit where GETDATE() between ValidFrom and ValidTo)
, cte as 
(select OrgPath =  hierarchyid::GetRoot()
, curr = OrgUnit
--, path_ = cast(OrgUnit as varchar(500)) + ' / ' 
, ParentOrgUnit from base
where OrgUnit = '20000001'

union all 

select 
cast(OrgPath.ToString() +  cast(base.OrgUnit as varchar(max)) +  '/' as hierarchyid)
,base.OrgUnit
--,path_ = cte.path_ + base.OrgUnit  + ' / '
,base.ParentOrgUnit 
 from cte inner join base on base.ParentOrgUnit = cte.curr
)
select human_path = replace(OrgPath.ToString(), '/', ' / '),  
human_level = OrgPath.GetLevel(), 
* from cte 