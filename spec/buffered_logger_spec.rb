require 'rspec/core'
require 'buffered_logger'

describe "Buffered Logger" do
  it "file remains empty if less than 5 logs are called" do
    log = BufferedLogger.new("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt")

    log.log("test1")
    log.log("test2")
    log.log("test3")
    log.log("test4")

    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).to eq("")

  end

  it "file includes input when more than 5 logs are called" do
    log = BufferedLogger.new("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt")

    log.log("test1")
    log.log("test2")
    log.log("test3")
    log.log("test4")
    log.log("test5")

    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test1")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test2")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test3")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test4")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test5")

  end

  it "file contains hour, minute, second, milisecond of when it was logged" do
    log = BufferedLogger.new("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt")

    log.log("test1")
    log.log("test2")
    log.log("test3")
    log.log("test4")
    log.log("test5")

    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).to_not eq("test1\ntest2\ntest3\ntest4\ntest5\n")

  end

  it "adds new content only when multiples of 5 are logged" do
    log = BufferedLogger.new("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt")

    log.log("test1")
    log.log("test2")
    log.log("test3")
    log.log("test4")
    log.log("test5")
    log.log("test6")
    log.log("test7")
    log.log("test8")
    log.log("test9")
    log.log("test10")
    log.log("test11")

    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test1")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test2")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test3")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test4")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test5")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test6")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test7")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test8")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test9")
    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should include("test10")

    expect(File.open("/Users/stevenmagelowitz/gSchoolWork/buffered_logger/lib/log.txt").read).should_not include("test11")

  end


end