# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from pcl_icp/nose_xyz_data.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class nose_xyz_data(genpy.Message):
  _md5sum = "bdeaa40a8607bdbfa496b05a8dcf2e21"
  _type = "pcl_icp/nose_xyz_data"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int64 lnx
int64 lny
int64 rnx
int64 rny
"""
  __slots__ = ['lnx','lny','rnx','rny']
  _slot_types = ['int64','int64','int64','int64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       lnx,lny,rnx,rny

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(nose_xyz_data, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.lnx is None:
        self.lnx = 0
      if self.lny is None:
        self.lny = 0
      if self.rnx is None:
        self.rnx = 0
      if self.rny is None:
        self.rny = 0
    else:
      self.lnx = 0
      self.lny = 0
      self.rnx = 0
      self.rny = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_4q().pack(_x.lnx, _x.lny, _x.rnx, _x.rny))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 32
      (_x.lnx, _x.lny, _x.rnx, _x.rny,) = _get_struct_4q().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_4q().pack(_x.lnx, _x.lny, _x.rnx, _x.rny))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 32
      (_x.lnx, _x.lny, _x.rnx, _x.rny,) = _get_struct_4q().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4q = None
def _get_struct_4q():
    global _struct_4q
    if _struct_4q is None:
        _struct_4q = struct.Struct("<4q")
    return _struct_4q