--1. traffic_accident. 각 교통 수단 별(지하철, 철도, 항공기, 선박, 자동차) 발생한 총 교통 사고 발생 수, 총 사망자 수, 사건 당 평균 사망자 수를 가져오시오.
select
    trans_type,
    count(total_acct_num) as "총 사고 발생 수",round(avg(death_person_num)) as "평균 사망자 수"
from traffic_accident
    group by trans_type;
--2. tblZoo. 종류(family)별 평균 다리의 갯수를 가져오시오.
select
    family,
    round(avg(leg)) as "평균 다리 갯수"
from tblZoo
    GROUP BY family;
--3. tblZoo. 체온이 변온인 종류 중 아가미 호흡과 폐 호흡을 하는 종들의 갯수를 가져오시오.
select
    thermo,
    count(*)
from tblZoo
    GROUP BY thermo;
--4. tblZoo. 사이즈와 종류별로 그룹을 나누고 각 그룹의 갯수를 가져오시오.
select
    sizeof,family,
    count(*)
from tblZoo
    GROUP BY sizeof,family;
-- and
select
    sizeof,family,
    count(*)
from tblZoo
    GROUP BY rollup(sizeof,family);
--5. tblMen. tblWomen. 서로 짝이 있는 사람 중 남자와 여자의 정보를 모두 가져오시오.
--    [남자]        [남자키]   [남자몸무게]     [여자]    [여자키]   [여자몸무게]
--    홍길동         180       70            장도연     177        65
--    아무개         175       null          이세영     163        null
--    ..
select
    name as "[남자]",
    height as "[남자키]",
    weight as "[남자몸무게]",
    (select name from tblWomen where tblmen.couple = name) as "[여자]",
    (select height from tblWomen where tblmen.couple = name) as "[여자키]",
    (select weight from tblWomen where tblmen.couple = name) as "[여자몸무게]"
from tblMen
    where couple is not null;
--10. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 주로 어느 지역 태생(hometown)인가?
select
    hometown
from tblAddressBook
    group by job , hometown
    having count(*) = (SELECT MAX(COUNT(*)) FROM TBLADDRESSbOOK GROUP BY JOB, hometown);
--12. tblAddressBook. 관리자의 실수로 몇몇 사람들의 이메일 주소가 중복되었다. 중복된 이메일 주소만 가져오시오.
select
    email
from tblAddressBook
    group by email
    having count(*)>1;
--13. tblAddressBook. 이메일 도메인들 중 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?
SELECT
    DISTINCT(SUBSTR(email,INSTR(EMAIL,'@')+1))
FROM TBLADDRESSbOOK
    GROUP BY SUBSTR(email,INSTR(EMAIL,'@')+1) , SUBSTR(EMAIL,0,INSTR(EMAIL,'@')-1)
    HAVING AVG(LENGTH(SUBSTR(EMAIL,0,INSTR(EMAIL,'@')-1))) = (SELECT MAX(AVG(LENGTH(SUBSTR(EMAIL,0,INSTR(EMAIL,'@')-1)))) FROM TBLADDRESSbOOK GROUP BY SUBSTR(email,INSTR(EMAIL,'@')+1) , SUBSTR(EMAIL,0,INSTR(EMAIL,'@')-1));
--14. tblAddressBook. 평균 나이가 가장 많은 출신(hometown)들이 가지고 있는 직업 중 가장 많은 직업은?
select * from tblAddressBook;
select
    job
from tbladdressbook
    where hometown = (select HOMETOWN from tblAddressBook group by HOMETOWN Having avg(age) = (select max(avg(age)) from tblAddressBook group by HOMETOWN))
        group by job
            HAVING count(job) = (select
                                    max(count(job))
                                from tbladdressbook
                                    where hometown = (select HOMETOWN from tblAddressBook group by HOMETOWN Having avg(age) = (select max(avg(age)) from tblAddressBook group by HOMETOWN))
                                        group by job);
--15. tblAddressBook. 성씨별 인원수가 100명 이상 되는 성씨들을 가져오시오.
select
    *
from tblAddressBook;
select
    substr(NAME,1,1)
from tblAddressBook
    group by substr(NAME,1,1)
        having count(substr(NAME,1,1))>=100;
--16. tblAddressBook. 남자 평균 나이보다 나이가 많은 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.
select
    *
from tblAddressBook;
select
    *
from tbladdressbook
    where HOMETOWN = '서울'   and
            age > (select
                        avg(age)
                    from tblAddressBook
                        where gender = 'm')
                            and job is not null;
--17. tblAddressBook. 이메일이 스네이크 명명법으로 만들어진 사람들 중에서 여자이며, 20대이며, 키가 150~160cm 사이며, 고향이 서울 또는 인천인 사람들만 가져오시오.
select
    *
from tblAddressBook;
select
    *
from tblAddressBook
    where email like '%@_%'escape'@' and
            gender = 'f' and
            age between 20 and 29 and
            height between 150 and 160 and
            hometown in ('서울','인천');
--18. tblAddressBook. gmail.com을 사용하는 사람들의 성별 > 세대별(10,20,30,40대) 인원수를 가져오시오.
select
    *
from tblAddressBook;
select
    floor(age/10)*10,
    gender,
    count(floor(age/10))
from tblAddressBook
    where lower(email) like '%gmail.com'
        group by gender , floor(age/10)
        order by floor(age/10);
--19. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 같은 직업을 가지는 사람들을 가져오시오.
select
    *
from tblAddressBook;
select
    *
from tblAddressBook
    where job = (select
                        job
                    from tblAddressBook
                        where age = (select max(age) from tblAddressBook) and
                    weight = (select max(weight) from tblAddressBook));
--20. tblAddressBook. '건물주'와 '건물주자제분'들의 거주지가 서울과 지방의 비율이 어떻게 되느냐?
select
    *
from tblAddressBook;
select
    to_char(round((count(decode(substr(address,1,instr(address,' ')-1),'서울특별시',1)))/count(*)*100,1),'99.9') || '%' as "서울",
    to_char(round((count(*) - count(decode(substr(address,1,instr(address,' ')-1),'서울특별시',1)))/count(*)*100,1),'99.9') || '%' as "지방"
from tblAddressBook
    where job in('건물주','건물자제분');
--21. tblAddressBook.  동명이인이 여러명 있습니다. 이 중 가장 인원수가 많은 동명이인(모든 이도윤)의 명단을 가져오시오.
select
    *
from tblAddressBook
    where name = (select
                        name
                    from tblAddressBook
                        group by name
                        having count(name) =  (select
                                                    max(count(name))
                                                from tblAddressBook
                                                    group by name));

--22. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
--    [10대]       [20대]       [30대]       [40대]
--    8.7%        30.7%        28.3%        32.2%
select
    *
from tblAddressBook;

select
    floor(age/10)*10 as "세대",
    round((count(*)/(select
                count(*)
            from tblAddressBook
                where job = (select
                                job
                            from tblAddressBook
                                group by job
                                having count(job) = (select max(count(job)) from tblAddressBook group by job))))*100,1) as "비율"
from tblAddressBook
    where job = (select
                    job
                from tblAddressBook
                    group by job
                    having count(job) = (select max(count(job)) from tblAddressBook group by job))
    group by floor(age/10);





