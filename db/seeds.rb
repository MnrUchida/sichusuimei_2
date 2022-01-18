# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dates = [
  { division_date: "2022/1/5 18:14" },
  { division_date: "2022/2/4 5:51" },
  { division_date: "2022/3/5 23:44" },
  { division_date: "2022/4/5 4:20" },
  { division_date: "2022/5/5 21:26" },
  { division_date: "2022/6/6 1:26" },
  { division_date: "2022/7/7 11:38" },
  { division_date: "2022/8/7 21:29" },
  { division_date: "2022/9/8 0:32" },
  { division_date: "2022/10/8 16:22" },
  { division_date: "2022/11/7 19:45" },
  { division_date: "2022/12/7 12:46" },
  { division_date: "2021/1/5 12:23" },
  { division_date: "2021/2/3 23:59" },
  { division_date: "2021/3/5 17:54" },
  { division_date: "2021/4/4 22:35" },
  { division_date: "2021/5/5 15:47" },
  { division_date: "2021/6/5 19:52" },
  { division_date: "2021/7/7 6:05" },
  { division_date: "2021/8/7 15:54" },
  { division_date: "2021/9/7 18:53" },
  { division_date: "2021/10/8 10:39" },
  { division_date: "2021/11/7 13:59" },
  { division_date: "2021/12/7 6:57" },
  { division_date: "2020/1/6 6:30" },
  { division_date: "2020/2/4 18:03" },
  { division_date: "2020/3/5 11:57" },
  { division_date: "2020/4/4 16:38" },
  { division_date: "2020/5/5 9:51" },
  { division_date: "2020/6/5 13:58" },
  { division_date: "2020/7/7 0:14" },
  { division_date: "2020/8/7 10:06" },
  { division_date: "2020/9/7 13:08" },
  { division_date: "2020/10/8 4:55" },
  { division_date: "2020/11/7 8:14" },
  { division_date: "2020/12/7 1:09" },
  { division_date: "2019/1/6 0:39" },
  { division_date: "2019/2/4 12:14" },
  { division_date: "2019/3/6 6:10" },
  { division_date: "2019/4/5 10:51" },
  { division_date: "2019/5/6 4:03" },
  { division_date: "2019/6/6 8:06" },
  { division_date: "2019/7/7 18:21" },
  { division_date: "2019/8/8 4:13" },
  { division_date: "2019/9/8 7:17" },
  { division_date: "2019/10/8 23:06" },
  { division_date: "2019/11/8 2:24" },
  { division_date: "2019/12/7 19:18" },
  { division_date: "2018/1/5 18:49" },
  { division_date: "2018/2/4 6:28" },
  { division_date: "2018/3/6 0:28" },
  { division_date: "2018/4/5 5:13" },
  { division_date: "2018/5/5 22:25" },
  { division_date: "2018/6/6 2:29" },
  { division_date: "2018/7/7 12:42" },
  { division_date: "2018/8/7 22:31" },
  { division_date: "2018/9/8 1:30" },
  { division_date: "2018/10/8 17:15" },
  { division_date: "2018/11/7 20:32" },
  { division_date: "2018/12/7 13:26" },
  { division_date: "2017/1/5 12:56" },
  { division_date: "2017/2/4 0:34" },
  { division_date: "2017/3/5 18:33" },
  { division_date: "2017/4/4 23:17" },
  { division_date: "2017/5/5 16:31" },
  { division_date: "2017/6/5 20:37" },
  { division_date: "2017/7/7 6:51" },
  { division_date: "2017/8/7 16:40" },
  { division_date: "2017/9/7 19:39" },
  { division_date: "2017/10/8 11:22" },
  { division_date: "2017/11/7 14:38" },
  { division_date: "2017/12/7 7:33" },
  { division_date: "2016/1/6 7:08" },
  { division_date: "2016/2/4 18:46" },
  { division_date: "2016/3/5 12:44" },
  { division_date: "2016/4/4 17:28" },
  { division_date: "2016/5/5 10:42" },
  { division_date: "2016/6/5 14:49" },
  { division_date: "2016/7/7 1:03" },
  { division_date: "2016/8/7 10:53" },
  { division_date: "2016/9/7 13:51" },
  { division_date: "2016/10/8 5:33" },
  { division_date: "2016/11/7 8:48" },
  { division_date: "2016/12/7 1:41" },
  { division_date: "2015/1/6 1:21" },
  { division_date: "2015/2/4 12:58" },
  { division_date: "2015/3/6 6:56" },
  { division_date: "2015/4/5 11:39" },
  { division_date: "2015/5/6 4:53" },
  { division_date: "2015/6/6 8:58" },
  { division_date: "2015/7/7 19:12" },
  { division_date: "2015/8/8 5:01" },
  { division_date: "2015/9/8 8:00" },
  { division_date: "2015/10/8 23:43" },
  { division_date: "2015/11/8 2:59" },
  { division_date: "2015/12/7 19:53" },
  { division_date: "2014/1/5 19:24" },
  { division_date: "2014/2/4 7:03" },
  { division_date: "2014/3/6 1:02" },
  { division_date: "2014/4/5 5:47" },
  { division_date: "2014/5/5 22:59" },
  { division_date: "2014/6/6 3:03" },
  { division_date: "2014/7/7 13:15" },
  { division_date: "2014/8/7 23:02" },
  { division_date: "2014/9/8 2:01" },
  { division_date: "2014/10/8 17:48" },
  { division_date: "2014/11/7 21:07" },
  { division_date: "2014/12/7 14:04" },
  { division_date: "2013/1/5 13:34" },
  { division_date: "2013/2/4 1:13" },
  { division_date: "2013/3/5 19:15" },
  { division_date: "2013/4/5 0:02" },
  { division_date: "2013/5/5 17:18" },
  { division_date: "2013/6/5 21:23" },
  { division_date: "2013/7/7 7:35" },
  { division_date: "2013/8/7 17:20" },
  { division_date: "2013/9/7 20:16" },
  { division_date: "2013/10/8 11:58" },
  { division_date: "2013/11/7 15:14" },
  { division_date: "2013/12/7 8:09" },
  { division_date: "2012/1/6 7:44" },
  { division_date: "2012/2/4 19:22" },
  { division_date: "2012/3/5 13:21" },
  { division_date: "2012/4/4 18:06" },
  { division_date: "2012/5/5 11:20" },
  { division_date: "2012/6/5 15:26" },
  { division_date: "2012/7/7 1:41" },
  { division_date: "2012/8/7 11:31" },
  { division_date: "2012/9/7 14:29" },
  { division_date: "2012/10/8 6:12" },
  { division_date: "2012/11/7 9:26" },
  { division_date: "2012/12/7 2:19" },
  { division_date: "2011/1/6 1:55" },
  { division_date: "2011/2/4 13:33" },
  { division_date: "2011/3/6 7:30" },
  { division_date: "2011/4/5 12:12" },
  { division_date: "2011/5/6 5:23" },
  { division_date: "2011/6/6 9:27" },
  { division_date: "2011/7/7 19:42" },
  { division_date: "2011/8/8 5:33" },
  { division_date: "2011/9/8 8:34" },
  { division_date: "2011/10/9 0:19" },
  { division_date: "2011/11/8 3:35" },
  { division_date: "2011/12/7 20:29" },
  { division_date: "2010/1/5 20:09" },
  { division_date: "2010/2/4 7:48" },
  { division_date: "2010/3/6 1:46" },
  { division_date: "2010/4/5 6:30" },
  { division_date: "2010/5/5 23:44" },
  { division_date: "2010/6/6 3:49" },
  { division_date: "2010/7/7 14:02" },
  { division_date: "2010/8/7 23:49" },
  { division_date: "2010/9/8 2:45" },
  { division_date: "2010/10/8 18:26" },
  { division_date: "2010/11/7 21:42" },
  { division_date: "2010/12/7 14:38" },
  { division_date: "2009/1/5 14:14" },
  { division_date: "2009/2/4 1:50" },
  { division_date: "2009/3/5 19:48" },
  { division_date: "2009/4/5 0:34" },
  { division_date: "2009/5/5 17:51" },
  { division_date: "2009/6/5 21:59" },
  { division_date: "2009/7/7 8:13" },
  { division_date: "2009/8/7 18:01" },
  { division_date: "2009/9/7 20:58" },
  { division_date: "2009/10/8 12:40" },
  { division_date: "2009/11/7 15:56" },
  { division_date: "2009/12/7 8:52" },
  { division_date: "2008/1/6 8:25" },
  { division_date: "2008/2/4 20:00" },
  { division_date: "2008/3/5 13:59" },
  { division_date: "2008/4/4 18:46" },
  { division_date: "2008/5/5 12:03" },
  { division_date: "2008/6/5 16:12" },
  { division_date: "2008/7/7 2:27" },
  { division_date: "2008/8/7 12:16" },
  { division_date: "2008/9/7 15:14" },
  { division_date: "2008/10/8 6:57" },
  { division_date: "2008/11/7 10:11" },
  { division_date: "2008/12/7 3:02" },
  { division_date: "2007/1/6 2:40" },
  { division_date: "2007/2/4 14:18" },
  { division_date: "2007/3/6 8:18" },
  { division_date: "2007/4/5 13:05" },
  { division_date: "2007/5/6 6:20" },
  { division_date: "2007/6/6 10:27" },
  { division_date: "2007/7/7 20:42" },
  { division_date: "2007/8/8 6:31" },
  { division_date: "2007/9/8 9:29" },
  { division_date: "2007/10/9 1:12" },
  { division_date: "2007/11/8 4:24" },
  { division_date: "2007/12/7 21:14" },
  { division_date: "2006/1/5 20:47" },
  { division_date: "2006/2/4 8:27" },
  { division_date: "2006/3/6 2:29" },
  { division_date: "2006/4/5 7:15" },
  { division_date: "2006/5/6 0:31" },
  { division_date: "2006/6/6 4:37" },
  { division_date: "2006/7/7 14:51" },
  { division_date: "2006/8/8 0:41" },
  { division_date: "2006/9/8 3:39" },
  { division_date: "2006/10/8 19:21" },
  { division_date: "2006/11/7 22:35" },
  { division_date: "2006/12/7 15:27" },
  { division_date: "2005/1/5 15:03" },
  { division_date: "2005/2/4 2:43" },
  { division_date: "2005/3/5 20:45" },
  { division_date: "2005/4/5 1:34" },
  { division_date: "2005/5/5 18:53" },
  { division_date: "2005/6/5 23:02" },
  { division_date: "2005/7/7 9:17" },
  { division_date: "2005/8/7 19:03" },
  { division_date: "2005/9/7 21:57" },
  { division_date: "2005/10/8 13:33" },
  { division_date: "2005/11/7 16:42" },
  { division_date: "2005/12/7 9:33" },
  { division_date: "2004/1/6 9:19" },
  { division_date: "2004/2/4 20:56" },
  { division_date: "2004/3/5 14:56" },
  { division_date: "2004/4/4 19:43" },
  { division_date: "2004/5/5 13:02" },
  { division_date: "2004/6/5 17:14" },
  { division_date: "2004/7/7 3:31" },
  { division_date: "2004/8/7 13:20" },
  { division_date: "2004/9/7 16:13" },
  { division_date: "2004/10/8 7:49" },
  { division_date: "2004/11/7 10:59" },
  { division_date: "2004/12/7 3:49" }
]
Season.delete_all
dates.each { |date| Season.create!(date) }
dates.each { |date| Season.update_season_seconds(date[:division_date]) }
