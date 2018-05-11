using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Smartsheduler_Api.MYDB;
namespace Smartsheduler_Api.Controllers
{
    public class ValuesController : ApiController
    {
        Smart_SchedulerEntities ss = new Smart_SchedulerEntities();


        public List<profileinformation> getProfile()
        {
            List<profileinformation> proInfoRes = ss.profileinformations.ToList();
            return proInfoRes;
        }

        public List<branchID> getBranchId(string bid)
        {
            List<branchID> brid = ss.branchIDs.Where(b => b.id == bid).ToList();
            return brid;
        }


        public List<subjectinformation> getSubjectInfo(string sbid)
        {
            List<subjectinformation> SubInfoRes = ss.subjectinformations.Where(s => s.SBid == sbid).ToList();
            return SubInfoRes;
        }


        public List<resultinformation> getResultInfo(string Enno)
        {
            List<resultinformation> SubInfoRes = ss.resultinformations.Where(s => s.Enno == Enno).ToList();
            return SubInfoRes;
        }

        public List<holidayinformation> getHoliday()
        {
            List<holidayinformation> holiInfoRes = ss.holidayinformations.ToList();
            return holiInfoRes;
        }


        public List<holidayinformation> getHolidayBySerial(int serial)
        {
            List<holidayinformation> holiInfoRes = ss.holidayinformations.Where(h => h.serial == serial).ToList();
            return holiInfoRes;
        }

        public List<timetableinformation> getTimeTableInfoByTid(string tid)
        {
            List<timetableinformation> TimetblIfo = ss.timetableinformations.Where(t => t.Tid == tid).ToList();
            return TimetblIfo;
        }

        // select s.subject from subjectinformation as s ,timetableinformation as t where s.SUBid=t.SUBid and t.Tid=''
        public List<string> getSubjectByTid(string tid)
        {
            var Res = (from s in ss.subjectinformations
                       join t in ss.timetableinformations
                      on s.SUBid equals t.SUBid
                       where t.Tid == tid
                       select s.subject).ToList();
            return Res;
        }


        //10. update profileinformation set mobile='' where Enno='';

        [HttpGet]
        public string updatePrfileMobilenoByEno(string eno, string mobileno)
        {
            try
            {
                profileinformation up = ss.profileinformations.Where(p => p.Enno == eno).Single();
                up.mobile = mobileno;
                ss.SaveChanges();
                return "Successfully";
            }
            catch (Exception ex)
            {
                return "failed";
            }
        }

        [HttpGet]
        public string updatePrfileEmailByEno(string eno, string email)
        {
            try
            {
                profileinformation up = ss.profileinformations.Where(p => p.Enno == eno).Single();
                up.Emailid = email;
                ss.SaveChanges();
                return "Successfully";
            }
            catch (Exception ex)
            {
                return "failed";
            }
        }

        [HttpGet]
        public string updatePrfilePasswordByEno(string eno, string Password)
        {
            try
            {
                profileinformation up = ss.profileinformations.Where(p => p.Enno == eno).Single();
                up.password = Password;
                ss.SaveChanges();
                return "Successfully";
            }
            catch (Exception ex)
            {
                return "failed";
            }
        }

        //select syllabus from subjectinformation where SUBid=''
        //allready  Created


        /// update profileinformation set password='' where Enno='';
        public List<notesinformation> getNotesInfoByEno(string eno)
        {
            List<notesinformation> noteinfo = ss.notesinformations.Where(n => n.Enno == eno).ToList();
            if (noteinfo.Count > 0)
            {
                return noteinfo;
            }
            else
            {
                return null;
            }
        }

        //insert into notesinformation (Enno,notes,Title) values('' , '' ,'' ) ;
        //api/Values/insertNotesInformation?eno=12120000&notes=notes&title=chem
        [HttpGet]
        public string insertNotesInformation(string eno, string notes, string title)
        {
            try
            {
                notesinformation ni = new notesinformation();
                ni.Enno = eno;
                ni.Title = title;
                ni.notes = notes;
                ni.date = DateTime.Now.Date.ToShortDateString();
                ss.notesinformations.Add(ni);
                ss.SaveChanges();
                return "successfully";
            }
            catch (Exception ex)
            {
                return "failed";
            }
        }

        ///update notesinformation set notes ='' , Title='' where rowid='';

        public bool getNotesInfoByEno(int rowid, string notes, string title)
        {
            notesinformation ni = ss.notesinformations.Where(n => n.rowid == rowid).Single();
            if (ni.rowid > 0)
            {
                ni.notes = notes;
                ni.Title = title;
                ss.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        // select rowid from notesinformation where Enno='' and Title='';

        public List<notesinformation> getNotesInfoByEnoAndTitle(string eno, string title)
        {

            List<notesinformation> lstnotes = ss.notesinformations.Where(n => n.Title == title && n.Enno == eno).ToList();
            if (lstnotes != null)
            {
                return lstnotes;
            }
            else
            {
                return null;
            }
        }

        ///delete from notesinformation where rowid='';
        [HttpGet]
        public string DeleteNotesInfofromRowId(int rowid)
        {
            notesinformation ni = ss.notesinformations.Where(n => n.rowid == rowid).Single();
            if (ni.rowid > 0)
            {
                ss.notesinformations.Remove(ni);
                ss.SaveChanges();
                return "successfully";
            }
            else
            {
                return "record not found";
            }
        }

        //select noticetitle from noticeinformation where SBid='' or SBid='0000';
        public List<noticeinformation> getnoticeinfofromSBid(string SBid1, string SBid2)
        {

            List<noticeinformation> lstni = ss.noticeinformations.Where(n => n.SBid == SBid1 || n.SBid == SBid2).ToList();
            if (lstni.Count > 0)
            {
                return lstni;
            }
            else
            {
                return null;
            }
        }

        //select * from placementinformation where SBid='';
        public List<placementinformation> getPlacementInfofromSbid(string sbid)
        {
            List<placementinformation> lstpi = ss.placementinformations.Where(p => p.SBid == sbid).ToList();

            if (lstpi.Count > 0)
            {
                return lstpi;
            }
            else
            {
                return null;
            }
        }




    }
}