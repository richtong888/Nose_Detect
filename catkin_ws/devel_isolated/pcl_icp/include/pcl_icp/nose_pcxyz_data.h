// Generated by gencpp from file pcl_icp/nose_pcxyz_data.msg
// DO NOT EDIT!


#ifndef PCL_ICP_MESSAGE_NOSE_PCXYZ_DATA_H
#define PCL_ICP_MESSAGE_NOSE_PCXYZ_DATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pcl_icp
{
template <class ContainerAllocator>
struct nose_pcxyz_data_
{
  typedef nose_pcxyz_data_<ContainerAllocator> Type;

  nose_pcxyz_data_()
    : pc_lnx(0.0)
    , pc_lny(0.0)
    , pc_lnz(0.0)
    , pc_rnx(0.0)
    , pc_rny(0.0)
    , pc_rnz(0.0)  {
    }
  nose_pcxyz_data_(const ContainerAllocator& _alloc)
    : pc_lnx(0.0)
    , pc_lny(0.0)
    , pc_lnz(0.0)
    , pc_rnx(0.0)
    , pc_rny(0.0)
    , pc_rnz(0.0)  {
  (void)_alloc;
    }



   typedef float _pc_lnx_type;
  _pc_lnx_type pc_lnx;

   typedef float _pc_lny_type;
  _pc_lny_type pc_lny;

   typedef float _pc_lnz_type;
  _pc_lnz_type pc_lnz;

   typedef float _pc_rnx_type;
  _pc_rnx_type pc_rnx;

   typedef float _pc_rny_type;
  _pc_rny_type pc_rny;

   typedef float _pc_rnz_type;
  _pc_rnz_type pc_rnz;





  typedef boost::shared_ptr< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> const> ConstPtr;

}; // struct nose_pcxyz_data_

typedef ::pcl_icp::nose_pcxyz_data_<std::allocator<void> > nose_pcxyz_data;

typedef boost::shared_ptr< ::pcl_icp::nose_pcxyz_data > nose_pcxyz_dataPtr;
typedef boost::shared_ptr< ::pcl_icp::nose_pcxyz_data const> nose_pcxyz_dataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator1> & lhs, const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator2> & rhs)
{
  return lhs.pc_lnx == rhs.pc_lnx &&
    lhs.pc_lny == rhs.pc_lny &&
    lhs.pc_lnz == rhs.pc_lnz &&
    lhs.pc_rnx == rhs.pc_rnx &&
    lhs.pc_rny == rhs.pc_rny &&
    lhs.pc_rnz == rhs.pc_rnz;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator1> & lhs, const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pcl_icp

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c1bcc417cdf6514a0c8a8d9befe1cdd8";
  }

  static const char* value(const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc1bcc417cdf6514aULL;
  static const uint64_t static_value2 = 0x0c8a8d9befe1cdd8ULL;
};

template<class ContainerAllocator>
struct DataType< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pcl_icp/nose_pcxyz_data";
  }

  static const char* value(const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 pc_lnx\n"
"float32 pc_lny\n"
"float32 pc_lnz\n"
"float32 pc_rnx\n"
"float32 pc_rny\n"
"float32 pc_rnz\n"
;
  }

  static const char* value(const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pc_lnx);
      stream.next(m.pc_lny);
      stream.next(m.pc_lnz);
      stream.next(m.pc_rnx);
      stream.next(m.pc_rny);
      stream.next(m.pc_rnz);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct nose_pcxyz_data_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pcl_icp::nose_pcxyz_data_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pcl_icp::nose_pcxyz_data_<ContainerAllocator>& v)
  {
    s << indent << "pc_lnx: ";
    Printer<float>::stream(s, indent + "  ", v.pc_lnx);
    s << indent << "pc_lny: ";
    Printer<float>::stream(s, indent + "  ", v.pc_lny);
    s << indent << "pc_lnz: ";
    Printer<float>::stream(s, indent + "  ", v.pc_lnz);
    s << indent << "pc_rnx: ";
    Printer<float>::stream(s, indent + "  ", v.pc_rnx);
    s << indent << "pc_rny: ";
    Printer<float>::stream(s, indent + "  ", v.pc_rny);
    s << indent << "pc_rnz: ";
    Printer<float>::stream(s, indent + "  ", v.pc_rnz);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PCL_ICP_MESSAGE_NOSE_PCXYZ_DATA_H