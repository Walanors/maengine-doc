---@meta
-- MAEngine Lua API Type Definitions
-- EmmyLua annotations for IDE autocomplete
-- Supports both Server and Client APIs

--------------------------------------------------------------------------------
-- Global Functions (Both Server and Client)
--------------------------------------------------------------------------------

---Get time in seconds since runtime started
---@return number seconds
function GetWorldTime() end

---Get time since last tick
---@return number delta_time Seconds since last tick
function GetDeltaTime() end

---Log a message to console
---@param ... any Values to log
function Log(...) end

---Generate a random UUID v4
---@return string uuid UUID string (lowercase with hyphens)
function UUID() end

--------------------------------------------------------------------------------
-- Global Functions (Server Only)
--------------------------------------------------------------------------------

---Output a warning message to the console (SERVER ONLY)
---@param msg string Message to log
function Warn(msg) end

---Output an error message to the console (SERVER ONLY)
---@param msg string Message to log
function Error(msg) end

---Get current time as ISO 8601 UTC string (SERVER ONLY)
---@return string timestamp ISO 8601 formatted timestamp
function GetTimestamp() end

---Get Unix timestamp in seconds (SERVER ONLY)
---@return integer timestamp Seconds since 1970-01-01
function GetUnixTime() end

---Get Unix timestamp in milliseconds (SERVER ONLY)
---@return integer timestamp Milliseconds since 1970-01-01
function GetUnixTimeMillis() end

--------------------------------------------------------------------------------
-- Math Types (Both Server and Client)
--------------------------------------------------------------------------------

---@class Vec3
---@field x number X component
---@field y number Y component
---@field z number Z component
---@operator add(Vec3): Vec3
---@operator sub(Vec3): Vec3
---@operator mul(number): Vec3
---@operator div(number): Vec3
---@operator unm: Vec3
Vec3 = {}

---Create a new Vec3
---@param x? number X component (default 0)
---@param y? number Y component (default 0)
---@param z? number Z component (default 0)
---@return Vec3
function Vec3(x, y, z) end

---Create a new Vec3
---@param x? number
---@param y? number
---@param z? number
---@return Vec3
function Vec3.new(x, y, z) end

---@return Vec3
function Vec3.zero() end

---@return Vec3
function Vec3.one() end

---@return number
function Vec3:length() end

---@return number
function Vec3:length_squared() end

---@return Vec3
function Vec3:normalized() end

---@param other Vec3
---@return number
function Vec3:dot(other) end

---@param other Vec3
---@return Vec3
function Vec3:cross(other) end

---@param other Vec3
---@return number
function Vec3:distance(other) end

---@param other Vec3
---@param t number Interpolation factor (0-1)
---@return Vec3
function Vec3:lerp(other, t) end

--------------------------------------------------------------------------------

---@class Quat
---@field x number
---@field y number
---@field z number
---@field w number
---@operator mul(Quat): Quat
Quat = {}

---Create a new Quat
---@param x? number
---@param y? number
---@param z? number
---@param w? number
---@return Quat
function Quat(x, y, z, w) end

---@return Quat
function Quat.identity() end

---Create quaternion from Euler angles in degrees
---@param pitch number
---@param yaw number
---@param roll number
---@return Quat
function Quat.from_euler_degrees(pitch, yaw, roll) end

---Create quaternion from axis and angle
---@param axis Vec3 Normalized axis
---@param angle number Angle in degrees
---@return Quat
function Quat.from_axis_angle(axis, angle) end

---@return number pitch, number yaw, number roll
function Quat:to_euler_degrees() end

---@param vec Vec3
---@return Vec3
function Quat:rotate_vector(vec) end

---@return Vec3
function Quat:forward() end

---@return Vec3
function Quat:right() end

---@return Vec3
function Quat:up() end

---@return Quat
function Quat:normalized() end

---@return Quat
function Quat:inverse() end

---@param other Quat
---@param t number
---@return Quat
function Quat:slerp(other, t) end

--------------------------------------------------------------------------------

---@class Rotator
---@field pitch number
---@field yaw number
---@field roll number
Rotator = {}

---@param pitch? number
---@param yaw? number
---@param roll? number
---@return Rotator
function Rotator(pitch, yaw, roll) end

---@return Rotator
function Rotator.zero() end

---@param quat Quat
---@return Rotator
function Rotator.from_quat(quat) end

---@return Quat
function Rotator:to_quat() end

--------------------------------------------------------------------------------

---@class Color
---@field r integer Red (0-255)
---@field g integer Green (0-255)
---@field b integer Blue (0-255)
---@field a integer Alpha (0-255)
Color = {}

---@param r? integer
---@param g? integer
---@param b? integer
---@param a? integer
---@return Color
function Color(r, g, b, a) end

---@return Color
function Color.white() end

---@return Color
function Color.black() end

---@return Color
function Color.red() end

---@return Color
function Color.green() end

---@return Color
function Color.blue() end

---@param other Color
---@param t number
---@return Color
function Color:lerp(other, t) end

--------------------------------------------------------------------------------
-- Timer (Both Server and Client)
--------------------------------------------------------------------------------

---@class Timer
Timer = {}

---Schedule a one-time callback
---@param seconds number Delay in seconds
---@param callback function Function to call
---@return integer timer_id Timer ID for cancellation
function Timer.Delay(seconds, callback) end

---Schedule a one-time callback (alias for Delay)
---@param seconds number Delay in seconds
---@param callback function Function to call
---@return integer timer_id
function Timer.Timeout(seconds, callback) end

---Schedule a repeating callback
---@param seconds number Interval in seconds
---@param callback function Function to call
---@return integer timer_id Timer ID for cancellation
function Timer.Interval(seconds, callback) end

---Cancel a scheduled timer
---@param id integer Timer ID
---@return boolean success True if cancelled
function Timer.Clear(id) end

--------------------------------------------------------------------------------
-- Events (Both Server and Client, different remote APIs)
--------------------------------------------------------------------------------

---@class Events
Events = {}

---Subscribe to a local event
---@param event_name string
---@param callback function
function Events.Subscribe(event_name, callback) end

---Fire a local event
---@param event_name string
---@param ... any Arguments to pass
function Events.Call(event_name, ...) end

---Unsubscribe from a local event
---@param event_name string
function Events.Unsubscribe(event_name) end

-- Server-only remote events

---Subscribe to remote events from clients (SERVER ONLY)
---@param event_name string
---@param callback fun(player: Player, data: any)
function Events.SubscribeRemote(event_name, callback) end

---Send event to specific player (SERVER ONLY)
---@param event_name string
---@param player Player|integer
---@param data any
function Events.CallRemote(event_name, player, data) end

---Send event to all players (SERVER ONLY)
---@param event_name string
---@param data any
function Events.BroadcastRemote(event_name, data) end

---Send event to server (CLIENT ONLY)
---@param event_name string
---@param data any
function Events.CallServer(event_name, data) end

--------------------------------------------------------------------------------
-- Entity (Both Server and Client)
--------------------------------------------------------------------------------

---@class Entity
---@field Subscribe fun(event: string, callback: function) Subscribe to class events
---@field GetAll fun(): Entity[] Get all entities of this class
---@field GetByID fun(id: integer): Entity? Get entity by ID
---@field GetCount fun(): integer Get count of entities
---@field BindValue fun(key: string, callback: function) Bind to value changes
---@field Inherit fun(name: string): table Create custom subclass
Entity = {}

---@return integer
function Entity:GetId() end

---@return integer
function Entity:GetID() end

---@return string
function Entity:GetClass() end

---@return string
function Entity:GetType() end

---@return string
function Entity:GetBaseClass() end

---@param className string
---@return boolean
function Entity:IsA(className) end

---@return boolean
function Entity:IsValid() end

---@return Vec3
function Entity:GetPosition() end

---@return Vec3
function Entity:GetLocation() end

---@param position Vec3
function Entity:SetPosition(position) end

---@param position Vec3
function Entity:SetLocation(position) end

---@return Quat
function Entity:GetRotation() end

---@param rotation Quat
function Entity:SetRotation(rotation) end

---@return Vec3
function Entity:GetScale() end

---@param scale Vec3
function Entity:SetScale(scale) end

---@param key string
---@return any
function Entity:GetValue(key) end

---@param key string
---@param value any
function Entity:SetValue(key, value) end

---@param key string
---@param value any
function Entity:SetPrivateValue(key, value) end

---@param key string
---@param callback fun(entity: Entity, key: string, newVal: any, oldVal: any)
function Entity:BindValue(key, callback) end

---@param event string
---@param callback function
function Entity:Subscribe(event, callback) end

---@param event string
---@param ... any
function Entity:Fire(event, ...) end

---@return string?
function Entity:GetAssetKey() end

---@param visible boolean
function Entity:SetVisibility(visible) end

---@param enabled boolean
function Entity:SetCollision(enabled) end

function Entity:Destroy() end

--------------------------------------------------------------------------------
-- Character (Server spawnable, both sides readable)
--------------------------------------------------------------------------------

---@class Character : Entity
Character = {}

---Spawn a character (SERVER ONLY)
---@param position Vec3
---@param rotation? Quat
---@param asset_key? string
---@return Character
function Character.Spawn(position, rotation, asset_key) end

---@return Vec3
function Character:GetVelocity() end

---@param velocity Vec3
function Character:SetVelocity(velocity) end

---@return Quat
function Character:GetControlRotation() end

---@param rotation Quat
function Character:SetControlRotation(rotation) end

---@return integer? Player ID or nil
function Character:GetPlayer() end

function Character:Jump() end

---@return boolean
function Character:IsGrounded() end

---Play animation (PLANNED - not yet implemented)
---@param name string Animation name
---@param slot? string Animation slot
function Character:PlayAnimation(name, slot) end

---Stop animation (PLANNED - not yet implemented)
---@param slot string Animation slot
function Character:StopAnimation(slot) end

--------------------------------------------------------------------------------
-- Other Spawnable Classes (SERVER ONLY)
--------------------------------------------------------------------------------

---@class StaticMesh : Entity
StaticMesh = {}

---@param position Vec3
---@param rotation? Quat
---@param asset_key? string
---@return StaticMesh
function StaticMesh.Spawn(position, rotation, asset_key) end

---@class Prop : Entity
Prop = {}

---@param position Vec3
---@param rotation? Quat
---@param asset_key? string
---@return Prop
function Prop.Spawn(position, rotation, asset_key) end

---@param velocity Vec3
function Prop:SetVelocity(velocity) end

---@class Sound : Entity
Sound = {}

---@param position Vec3
---@param asset_key string
---@param auto_play? boolean
---@return Sound
function Sound.Spawn(position, asset_key, auto_play) end

---@class Particle : Entity
Particle = {}

---@param position Vec3
---@param rotation? Quat
---@param asset_key? string
---@return Particle
function Particle.Spawn(position, rotation, asset_key) end

---@class Blueprint : Entity
Blueprint = {}

---@param position Vec3
---@param rotation? Quat
---@param asset_path? string
---@return Blueprint
function Blueprint.Spawn(position, rotation, asset_path) end

--------------------------------------------------------------------------------
-- Player (Both sides, different capabilities)
--------------------------------------------------------------------------------

---@class Player
---@field Subscribe fun(event: string, callback: function) Subscribe to class events
---@field GetAll fun(): Player[] Get all players
---@field GetByID fun(id: integer): Player? Get player by ID
---@field GetCount fun(): integer Get player count
---@field BindValue fun(key: string, callback: function) Bind to value changes
Player = {}

---@return integer
function Player:GetId() end

---@return integer
function Player:GetID() end

---@return integer
function Player:GetConnectionId() end

---@return boolean
function Player:IsValid() end

---@return Character?
function Player:GetControlledCharacter() end

---@param key string
---@return any
function Player:GetValue(key) end

-- Server-only methods

---@param pawn Entity
function Player:Possess(pawn) end

function Player:UnPossess() end

---@param key string
---@param value any
function Player:SetValue(key, value) end

---@param key string
---@return any
function Player:GetPrivateValue(key) end

---@param key string
---@param value any
function Player:SetPrivateValue(key, value) end

---@param key string
---@param callback fun(player: Player, key: string, newVal: any, oldVal: any)
function Player:BindValue(key, callback) end

---@return table
function Player:GetAllValues() end

---@return table
function Player:GetAllPrivateValues() end

---@param message string
function Player:SendMessage(message) end

---@param reason? string
function Player:Kick(reason) end

---@return integer Latency in milliseconds
function Player:GetLatency() end

--------------------------------------------------------------------------------
-- Server (SERVER ONLY)
--------------------------------------------------------------------------------

---@class Server
Server = {}

---Subscribe to server events
---@param event "Start"|"Stop"|"Tick"
---@param callback function
function Server.Subscribe(event, callback) end

---@return integer
function Server.GetTick() end

---@return integer Milliseconds
function Server.GetTime() end

---@return integer
function Server.GetTickRate() end

---@param message string
function Server.Broadcast(message) end

---@param reason? string
function Server.Shutdown(reason) end

--------------------------------------------------------------------------------
-- Client (CLIENT ONLY)
--------------------------------------------------------------------------------

---@class Client
Client = {}

---Subscribe to client events
---@param event "Spawn"|"Ready"
---@param callback function
function Client.Subscribe(event, callback) end

---@return Player
function Client.GetLocalPlayer() end

---@return Character?
function Client.GetLocalCharacter() end

--------------------------------------------------------------------------------
-- WebUI (CLIENT ONLY)
--------------------------------------------------------------------------------

---@class WebUI
WebUI = {}

---Create a fullscreen WebUI
---@param name string Unique identifier
---@param url string URL to load (use file:// for local)
---@param visible? boolean Initial visibility
---@return WebUI
function WebUI(name, url, visible) end

---Create WebUI with specific size
---@param name string
---@param url string
---@param width integer
---@param height integer
---@return WebUI
function WebUI.CreateWithSize(name, url, width, height) end

---Create WebUI scaled to viewport
---@param name string
---@param url string
---@param scale number Scale factor (0-1)
---@return WebUI
function WebUI.CreateAtScale(name, url, scale) end

---@param visible boolean
function WebUI:SetVisible(visible) end

---@return boolean
function WebUI:IsVisible() end

---@param focused boolean
function WebUI:SetFocus(focused) end

---@return boolean
function WebUI:HasFocus() end

function WebUI:BringToFront() end

function WebUI:SendToBack() end

---@param order integer
function WebUI:SetZOrder(order) end

---@param width integer
---@param height integer
function WebUI:SetSize(width, height) end

---@param x integer
---@param y integer
function WebUI:SetPosition(x, y) end

---@param fullscreen boolean
function WebUI:SetFullscreen(fullscreen) end

function WebUI:Reload() end

function WebUI:Destroy() end

---Send event from Lua to JavaScript
---@param event_name string
---@param ... any Data to pass
function WebUI:CallEvent(event_name, ...) end

---Subscribe to events from JavaScript
---@param event_name string
---@param callback function
function WebUI:Subscribe(event_name, callback) end

---@param event_name string
function WebUI:Unsubscribe(event_name) end

---Execute raw JavaScript
---@param js_code string
function WebUI:ExecuteJS(js_code) end

-- Static methods

function WebUI.ShowViewport() end

function WebUI.HideViewport() end

---@return boolean
function WebUI.IsViewportVisible() end

---@param capture boolean
function WebUI.SetViewportInputCapture(capture) end

---@param fps integer
function WebUI.SetTargetFPS(fps) end

---@return integer
function WebUI.GetTargetFPS() end

---@param enabled boolean
function WebUI.SetGPUAcceleration(enabled) end

---@param enabled boolean
function WebUI.SetEnabled(enabled) end

---@return integer width, integer height
function WebUI.GetViewportSize() end

--------------------------------------------------------------------------------
-- Store (CLIENT ONLY)
--------------------------------------------------------------------------------

---@class Store
---Bidirectional state synchronization between Lua and JavaScript (WebUI).
---Single source of truth in C++ with automatic batched updates per frame.
Store = {}

---Set a value in the store (syncs to all WebUI views automatically)
---@param path string Dot-notation path (e.g., "player.health")
---@param value any Value to set (nil, boolean, number, string, or table)
function Store.Set(path, value) end

---Get a cached value from the store
---@param path string Dot-notation path
---@return any value The cached value, or nil if not found
function Store.Get(path) end

---Set multiple values at once (more efficient than multiple Set calls)
---@param updates table<string, any> Table mapping paths to values
function Store.SetBatch(updates) end

---Subscribe to value changes
---@param path string Dot-notation path to watch
---@param callback fun(newVal: any, oldVal: any) Called when value changes
---@return fun() unsubscribe Function to call to stop watching
function Store.Subscribe(path, callback) end

---Print all cached store values to the log (debug utility)
function Store.Debug() end

--------------------------------------------------------------------------------
-- Input (CLIENT ONLY)
--------------------------------------------------------------------------------

---@class Input
---@field Pressed integer Key pressed event (1)
---@field Released integer Key released event (2)
Input = {
    Pressed = 1,
    Released = 2
}

---Register an action with a key
---@param action_name string
---@param key_name string Unreal key name
function Input.Register(action_name, key_name) end

---Bind callback to action event
---@param action_name string
---@param event_type integer Input.Pressed or Input.Released
---@param callback function
function Input.Bind(action_name, event_type, callback) end

--------------------------------------------------------------------------------
-- Trace (CLIENT ONLY)
--------------------------------------------------------------------------------

---@class HitResult
---@field location Vec3 Impact point
---@field normal Vec3 Surface normal
---@field actor Entity? Hit actor
---@field distance number Distance from start

---@class Trace
Trace = {}

---Cast a ray between two points
---@param start Vec3
---@param end_pos Vec3
---@param ignore_actors? Entity[]
---@return HitResult?
function Trace.Line(start, end_pos, ignore_actors) end

---Cast ray from camera
---@param distance number Maximum distance
---@param ignore_local? boolean Ignore local character (default true)
---@return HitResult?
function Trace.FromCamera(distance, ignore_local) end

---Cast ray from character eye
---@param distance number Maximum distance
---@param ignore_local? boolean Ignore local character (default true)
---@return HitResult?
function Trace.FromCharacter(distance, ignore_local) end

---Cast a sphere trace
---@param start Vec3
---@param end_pos Vec3
---@param radius number
---@param ignore_actors? Entity[]
---@return HitResult?
function Trace.Sphere(start, end_pos, radius, ignore_actors) end

---Enable debug visualization
---@param enabled boolean
---@param duration? number Seconds lines are visible
---@param thickness? number Line thickness
function Trace.SetDebug(enabled, duration, thickness) end

---@return boolean
function Trace.IsDebugEnabled() end

--------------------------------------------------------------------------------
-- Database (SERVER ONLY)
--------------------------------------------------------------------------------

---@class DB
DB = {}

-- Sync API

---@param table_name string
---@param data table
---@return string? id
function DB.Create(table_name, data) end

---@param table_name string
---@param id string
---@return table?
function DB.Get(table_name, id) end

---@param table_name string
---@param id string
---@param data table
---@return string? id
function DB.Set(table_name, id, data) end

---@param table_name string
---@param id string
---@param data table
---@return boolean
function DB.Update(table_name, id, data) end

---@param table_name string
---@param id string
---@return boolean
function DB.Delete(table_name, id) end

---@class FindOptions
---@field limit? integer Maximum records to return
---@field offset? integer Records to skip
---@field order_by? string Field to order by (prefix with "-" for descending)
local FindOptions = {}

---@param table_name string
---@param filter? table
---@param options? FindOptions Query options (limit, offset, order_by)
---@return table[]
function DB.Find(table_name, filter, options) end

---@param table_name string
---@param filter? table
---@return table?
function DB.FindOne(table_name, filter) end

---@param sql string SurrealQL query
---@param bindings? table
---@return table[]
function DB.Query(sql, bindings) end

---@param table_name string
---@return integer count
function DB.Preload(table_name) end

-- Async API

---@param table_name string
---@param id string
---@param callback fun(data: table?)
function DB.GetAsync(table_name, id, callback) end

---@param table_name string
---@param id string
---@param data table
---@param callback? fun(success: boolean)
function DB.SetAsync(table_name, id, data, callback) end

---@param table_name string
---@param data table
---@param callback? fun(id: string?)
function DB.CreateAsync(table_name, data, callback) end

---@param table_name string
---@param id string
---@param callback? fun(success: boolean)
function DB.DeleteAsync(table_name, id, callback) end

---@param table_name string
---@param id string
---@param data table
---@param callback? fun(success: boolean)
function DB.UpdateAsync(table_name, id, data, callback) end

---@param sql string
---@param callback fun(results: table[])
function DB.QueryAsync(sql, callback) end

---@param table_name string
---@param filter table?
---@param callback fun(results: table[])
function DB.FindAsync(table_name, filter, callback) end

-- Graph

---@param from string Record ID
---@param relation string Relation type
---@param to string Record ID
---@param data? table
---@return string? relation_id
function DB.Relate(from, relation, to, data) end

---@param from string
---@param relation string
---@param to string
---@return boolean
function DB.Unrelate(from, relation, to) end

---@param record string Record ID
---@param relation string Relation type
---@param direction? "in"|"out"|"both"
---@return table[]
function DB.GetRelated(record, relation, direction) end

---@param from string
---@param relation string
---@param to string
---@return table?
function DB.GetRelation(from, relation, to) end

-- Transactions

---@class TransactionBuilder
---@field Create fun(self, table: string, data: table): TransactionBuilder
---@field Update fun(self, table: string, id: string, data: table): TransactionBuilder
---@field Set fun(self, table: string, id: string, data: table): TransactionBuilder
---@field Merge fun(self, table: string, id: string, data: table): TransactionBuilder
---@field Delete fun(self, table: string, id: string): TransactionBuilder
---@field Relate fun(self, from: string, rel: string, to: string, data?: table): TransactionBuilder
---@field Commit fun(self): table[]

---@return TransactionBuilder
function DB.Begin() end

-- Schema

---@param table_name string
---@param mode? "schemaless"|"schemafull"
---@return boolean
function DB.DefineTable(table_name, mode) end

---@param table_name string
---@param field string
---@param field_type string
---@param options? table
---@return boolean
function DB.DefineField(table_name, field, field_type, options) end

---@param table_name string
---@param name string
---@param fields string[]
---@param type? "unique"|"search"
---@return boolean
function DB.DefineIndex(table_name, name, fields, type) end

---@param table_name string
---@param name string
---@param when string
---@param then_query string
---@return boolean
function DB.DefineEvent(table_name, name, when, then_query) end

-- Subscriptions

---@param table_name string
---@param event "Create"|"Update"|"Delete"
---@param callback fun(record: table)
---@param includeLocal? boolean Include changes from this script (default: false)
---@return string subscription_id
function DB.Subscribe(table_name, event, callback, includeLocal) end

---@param subscription_id string
---@return boolean
function DB.Unsubscribe(subscription_id) end

-- Utility

---@param table_name string
---@param filter? table
---@return integer
function DB.Count(table_name, filter) end

---@param table_name string
---@param id string
---@return boolean
function DB.Exists(table_name, id) end

---@param table_name string
---@return integer deleted_count
function DB.DeleteAll(table_name) end

---@return table
function DB.Info() end

---@return integer
function DB.FlushWrites() end

---@return integer
function DB.PendingWriteCount() end

-- Write Failure Handling

---@class WriteFailure
---@field table_name string Table where the write failed
---@field id string Record ID
---@field operation "set"|"update"|"delete"|"create" Type of operation
---@field error string Error message from SurrealDB
local WriteFailure = {}

---Register a callback for fire-and-forget write failures
---@param callback fun(failure: WriteFailure)
function DB.OnWriteFailure(callback) end
