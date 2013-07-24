module Systemd
  class Journal
    module Native
      require 'ffi'
      extend FFI::Library
      ffi_lib %w[libsystemd-journal.so libsystemd-journal.so.0]

      attach_function :sd_journal_open, [:pointer, :int], :int
      attach_function :sd_journal_open_directory, [:pointer, :string, :int], :int
      attach_function :sd_journal_close, [:pointer], :void

      attach_function :sd_journal_next,     [:pointer], :int
      attach_function :sd_journal_previous, [:pointer], :int

      attach_function :sd_journal_get_data, [:pointer, :string, :pointer, :pointer], :int
      attach_function :sd_journal_restart_data, [:pointer], :void
      attach_function :sd_journal_enumerate_data, [:pointer, :pointer, :pointer], :int

      attach_function :sd_journal_seek_head, [:pointer], :int
      attach_function :sd_journal_seek_tail, [:pointer], :int
      attach_function :sd_journal_seek_realtime_usec, [:pointer, :uint64], :int

    end

  end
end
