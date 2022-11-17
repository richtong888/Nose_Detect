// Auto-generated. Do not edit!

// (in-package pcl_icp.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class nose_pcxyz_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pc_lnx = null;
      this.pc_lny = null;
      this.pc_lnz = null;
      this.pc_rnx = null;
      this.pc_rny = null;
      this.pc_rnz = null;
    }
    else {
      if (initObj.hasOwnProperty('pc_lnx')) {
        this.pc_lnx = initObj.pc_lnx
      }
      else {
        this.pc_lnx = 0.0;
      }
      if (initObj.hasOwnProperty('pc_lny')) {
        this.pc_lny = initObj.pc_lny
      }
      else {
        this.pc_lny = 0.0;
      }
      if (initObj.hasOwnProperty('pc_lnz')) {
        this.pc_lnz = initObj.pc_lnz
      }
      else {
        this.pc_lnz = 0.0;
      }
      if (initObj.hasOwnProperty('pc_rnx')) {
        this.pc_rnx = initObj.pc_rnx
      }
      else {
        this.pc_rnx = 0.0;
      }
      if (initObj.hasOwnProperty('pc_rny')) {
        this.pc_rny = initObj.pc_rny
      }
      else {
        this.pc_rny = 0.0;
      }
      if (initObj.hasOwnProperty('pc_rnz')) {
        this.pc_rnz = initObj.pc_rnz
      }
      else {
        this.pc_rnz = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type nose_pcxyz_data
    // Serialize message field [pc_lnx]
    bufferOffset = _serializer.float32(obj.pc_lnx, buffer, bufferOffset);
    // Serialize message field [pc_lny]
    bufferOffset = _serializer.float32(obj.pc_lny, buffer, bufferOffset);
    // Serialize message field [pc_lnz]
    bufferOffset = _serializer.float32(obj.pc_lnz, buffer, bufferOffset);
    // Serialize message field [pc_rnx]
    bufferOffset = _serializer.float32(obj.pc_rnx, buffer, bufferOffset);
    // Serialize message field [pc_rny]
    bufferOffset = _serializer.float32(obj.pc_rny, buffer, bufferOffset);
    // Serialize message field [pc_rnz]
    bufferOffset = _serializer.float32(obj.pc_rnz, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type nose_pcxyz_data
    let len;
    let data = new nose_pcxyz_data(null);
    // Deserialize message field [pc_lnx]
    data.pc_lnx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pc_lny]
    data.pc_lny = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pc_lnz]
    data.pc_lnz = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pc_rnx]
    data.pc_rnx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pc_rny]
    data.pc_rny = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pc_rnz]
    data.pc_rnz = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pcl_icp/nose_pcxyz_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1bcc417cdf6514a0c8a8d9befe1cdd8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 pc_lnx
    float32 pc_lny
    float32 pc_lnz
    float32 pc_rnx
    float32 pc_rny
    float32 pc_rnz
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new nose_pcxyz_data(null);
    if (msg.pc_lnx !== undefined) {
      resolved.pc_lnx = msg.pc_lnx;
    }
    else {
      resolved.pc_lnx = 0.0
    }

    if (msg.pc_lny !== undefined) {
      resolved.pc_lny = msg.pc_lny;
    }
    else {
      resolved.pc_lny = 0.0
    }

    if (msg.pc_lnz !== undefined) {
      resolved.pc_lnz = msg.pc_lnz;
    }
    else {
      resolved.pc_lnz = 0.0
    }

    if (msg.pc_rnx !== undefined) {
      resolved.pc_rnx = msg.pc_rnx;
    }
    else {
      resolved.pc_rnx = 0.0
    }

    if (msg.pc_rny !== undefined) {
      resolved.pc_rny = msg.pc_rny;
    }
    else {
      resolved.pc_rny = 0.0
    }

    if (msg.pc_rnz !== undefined) {
      resolved.pc_rnz = msg.pc_rnz;
    }
    else {
      resolved.pc_rnz = 0.0
    }

    return resolved;
    }
};

module.exports = nose_pcxyz_data;
