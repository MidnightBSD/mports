--- src/libbg/spsr/Octree.inl.orig	2026-05-23 23:55:33 UTC
+++ src/libbg/spsr/Octree.inl
@@ -816,8 +816,7 @@ OctNode< NodeData >& OctNode< NodeData >::operator = (
 	if(children){delete[] children;}
 	children=NULL;
 
-	this->depth = node.depth;
-	for(i=0;i<DIMENSION;i++){this->offset[i] = node.offset[i];}
+	this->_depthAndOffset = node._depthAndOffset;
 	if(node.children){
 		initChildren();
 		for(i=0;i<Cube::CORNERS;i++){children[i] = node.children[i];}
@@ -826,17 +825,23 @@ int OctNode< NodeData >::CompareForwardDepths(const vo
 }
 template< class NodeData >
 int OctNode< NodeData >::CompareForwardDepths(const void* v1,const void* v2){
-	return ((const OctNode< NodeData >*)v1)->depth-((const OctNode< NodeData >*)v2)->depth;
+	return ((const OctNode< NodeData >*)v1)->depth()-((const OctNode< NodeData >*)v2)->depth();
 }
 template< class NodeData >
 int OctNode< NodeData >::CompareByDepthAndXYZ( const void* v1 , const void* v2 )
 {
 	const OctNode< NodeData > *n1 = (*(const OctNode< NodeData >**)v1);
 	const OctNode< NodeData > *n2 = (*(const OctNode< NodeData >**)v2);
-	if( n1->d!=n2->d ) return int(n1->d)-int(n2->d);
-	else if( n1->off[0]!=n2->off[0] ) return int(n1->off[0]) - int(n2->off[0]);
-	else if( n1->off[1]!=n2->off[1] ) return int(n1->off[1]) - int(n2->off[1]);
-	else if( n1->off[2]!=n2->off[2] ) return int(n1->off[2]) - int(n2->off[2]);
+	int d1, d2;
+	int off1[DIMENSION], off2[DIMENSION];
+
+	n1->depthAndOffset(d1, off1);
+	n2->depthAndOffset(d2, off2);
+
+	if( d1!=d2 ) return d1-d2;
+	else if( off1[0]!=off2[0] ) return off1[0] - off2[0];
+	else if( off1[1]!=off2[1] ) return off1[1] - off2[1];
+	else if( off1[2]!=off2[2] ) return off1[2] - off2[2];
 	return 0;
 }
 
@@ -866,20 +871,27 @@ int OctNode< NodeData >::CompareForwardPointerDepths( 
 {
 	const OctNode< NodeData >* n1 = (*(const OctNode< NodeData >**)v1);
 	const OctNode< NodeData >* n2 = (*(const OctNode< NodeData >**)v2);
-	if(n1->d!=n2->d){return int(n1->d)-int(n2->d);}
+	int d1, d2;
+	int off1[DIMENSION], off2[DIMENSION];
+
+	d1 = n1->depth();
+	d2 = n2->depth();
+	if(d1!=d2){return d1-d2;}
 	while( n1->parent!=n2->parent )
 	{
 		n1=n1->parent;
 		n2=n2->parent;
 	}
-	if(n1->off[0]!=n2->off[0]){return int(n1->off[0])-int(n2->off[0]);}
-	if(n1->off[1]!=n2->off[1]){return int(n1->off[1])-int(n2->off[1]);}
-	return int(n1->off[2])-int(n2->off[2]);
+	n1->depthAndOffset(d1, off1);
+	n2->depthAndOffset(d2, off2);
+	if(off1[0]!=off2[0]){return off1[0]-off2[0];}
+	if(off1[1]!=off2[1]){return off1[1]-off2[1];}
+	return off1[2]-off2[2];
 	return 0;
 }
 template< class NodeData >
 int OctNode< NodeData >::CompareBackwardDepths(const void* v1,const void* v2){
-	return ((const OctNode< NodeData >*)v2)->depth-((const OctNode< NodeData >*)v1)->depth;
+	return ((const OctNode< NodeData >*)v2)->depth()-((const OctNode< NodeData >*)v1)->depth();
 }
 template< class NodeData >
 int OctNode< NodeData >::CompareBackwardPointerDepths(const void* v1,const void* v2){
