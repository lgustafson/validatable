class Object #:nodoc:
  module InstanceExecHelper #:nodoc:
  end
  include InstanceExecHelper
  def instance_eval_with_params(*args, &block)
    # Compatibility check (Ruby 1.9 uses Thread.exclusive whereas Ruby 1.8 uses
    # Thread.critical
    if Thread.respond_to?(:critical=)
      # The following is for Ruby 1.8 compatibility.  TODO: cleanup
      begin
        old_critical, Thread.critical = Thread.critical, true
        n = 0
        n += 1 while respond_to?(mname="__instance_exec#{n}")
        InstanceExecHelper.module_eval{ define_method(mname, &block) }
      ensure
        Thread.critical = old_critical
      end
      begin
        ret = send(mname, *args)
      ensure
        InstanceExecHelper.module_eval{ remove_method(mname) } rescue nil
      end
    else
      # The following is for Ruby 1.9 compatibility.  TODO: cleanup
      omname = Thread.exclusive do
        n = 0
        n += 1 while respond_to?(mname="__instance_exec#{n}")
        InstanceExecHelper.module_eval{ define_method(mname, &block) }
        mname
      end
      begin
        ret = send(omname, *args)
      ensure
        InstanceExecHelper.module_eval{ remove_method(omname) } rescue nil
      end
    end

    ret
  end
end
