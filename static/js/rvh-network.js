import * as THREE from 'three';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

camera.position.set(-3, 0, 0);

const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setAnimationLoop(animate);
renderer.setClearColor(0x000000, 0);

function sphere(radius, material) {
  const geo = new THREE.SphereGeometry(radius, 32, 16); 
  const mat = new THREE.MeshBasicMaterial(material); 
  return new THREE.Mesh(geo, mat);
}

// two concentric sphers to show a sphere with a border
function rvh_node(radius, line) {
  const group = new THREE.Group();
  group.add(sphere(radius, { color: 0xffffff, side: THREE.FrontSide }));
  group.add(sphere(radius + line, { color: 0x4d8dc9ff, side: THREE.BackSide }));
  return group;
}

let elements = new THREE.Group();
elements.add(sphere(1.5, { color: 0x4d8dc9ff}));  // central sphere

function round(x, digits) {
  const exp = Math.pow(10, digits);
  var x = Math.round(x * exp) / exp;
  return x === -0 ? 0 : x
}

// deduplicate shell positions
const pos = new THREE.SphereGeometry(3, 3, 3).getAttribute('position');
var nodes = new Set();

for (let i = 0; i < pos.count; i++) {
  nodes.add(JSON.stringify({
    "x": round(pos.getX(i), 4),
    "y": round(pos.getY(i), 4),
    "z": round(pos.getZ(i), 4)
  }));
}

nodes = [...nodes].map(s => JSON.parse(s))

let geomUnitCylinder = new THREE.CylinderGeometry(0.2, 0.2, 1, 8, 1, true);
geomUnitCylinder.translate(0, 0.5, 0);

for (var i = 0; i < nodes.length; i++) {
  var radius = 0.3 + Math.random() * 0.2;
  var border = 0.4;

  // make the node
  var node = rvh_node(radius, border);
  node.position
    .set(
      nodes[i].x + (Math.random() - 0.5) * 2,
      nodes[i].y + (Math.random() - 0.5) * 2,
      nodes[i].z + (Math.random() - 0.5) * 2
    )
    .normalize()
    .multiplyScalar(5 + (Math.random() - 0.5) * 3);

  // add connecting lines from center to node
  const line_geo = new THREE.CylinderGeometry(0.2, 0.2, 1, 12);
  line_geo.translate(0, 0.5, 0);
  line_geo.scale(1, node.position.length() - radius - border + 0.1, 1);
  const line_rot = new THREE.Quaternion()
    .setFromUnitVectors(
      new THREE.Vector3(0, 1, 0),
      node.position.clone().normalize()
    );
  line_geo.applyQuaternion(line_rot);

  const material = new THREE.MeshBasicMaterial({ color: 0x4d8dc9ff }); 
  const line = new THREE.Mesh(line_geo, material);

  elements.add(line);
  elements.add(node);
}

scene.add(elements);
scene.fog = new THREE.Fog('white', 5, 20);

camera.position.z = 10;

function animate() {
	elements.rotation.x += 0.002;
	elements.rotation.y += 0.002;
	renderer.render(scene, camera);
}

export function network() {
  return renderer.domElement;
}

