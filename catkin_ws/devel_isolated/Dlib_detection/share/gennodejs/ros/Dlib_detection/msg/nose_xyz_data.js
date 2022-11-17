// Auto-generated. Do not edit!

// (in-package Dlib_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class nose_xyz_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lnx = null;
      this.lny = null;
      this.rnx = null;
      this.rny = null;
    }
    else {
      if (initObj.hasOwnProperty('lnx')) {
        this.lnx = initObj.lnx
      }
      else {
        this.lnx = 0;
      }
      if (initObj.hasOwnProperty('lny')) {
        this.lny = initObj.lny
      }
      else {
        this.lny = 0;
      }
      if (initObj.hasOwnProperty('rnx')) {
        this.rnx = initObj.rnx
      }
      else {
        this.rnx = 0;
      }
      if (initObj.hasOwnProperty('rny')) {
        this.rny = initObj.rny
      }
      else {
        this.rny = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type nose_xyz_data
    // Serialize message field [lnx]
    bufferOffset = _serializer.int64(obj.lnx, buffer, bufferOffset);
    // Serialize message field [lny]
    bufferOffset = _serializer.int64(obj.lny, buffer, bufferOffset);
    // Serialize message field [rnx]
    bufferOffset = _serializer.int64(obj.rnx, buffer, bufferOffset);
    // Serialize message field [rny]
    bufferOffset = _serializer.int64(obj.rny, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type nose_xyz_data
    let len;
    let data = new nose_xyz_data(null);
    // Deserialize message field [lnx]
    data.lnx = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [lny]
    data.lny = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [rnx]
    data.rnx = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [rny]
    data.rny = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'Dlib_detection/nose_xyz_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bdeaa40a8607bdbfa496b05a8dcf2e21';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 lnx
    int64 lny
    int64 rnx
    int64 rny
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new nose_xyz_data(null);
    if (msg.lnx !== undefined) {
      resolved.lnx = msg.lnx;
    }
    else {
      resolved.lnx = 0
    }

    if (msg.lny !== undefined) {
      resolved.lny = msg.lny;
    }
    else {
      resolved.lny = 0
    }

    if (msg.rnx !== undefined) {
      resolved.rnx = msg.rnx;
    }
    else {
      resolved.rnx = 0
    }

    if (msg.rny !== undefined) {
      resolved.rny = msg.rny;
    }
    else {
      resolved.rny = 0
    }

    return resolved;
    }
};

module.exports = nose_xyz_data;
