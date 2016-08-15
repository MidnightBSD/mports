# $MidnightBSD$

PORTNAME=	Graph
PORTVERSION=	0.96
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph, the Perl module for graph operations
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Heap.pm:${PORTSDIR}/devel/p5-Heap \
		${SITE_PERL}/${PERL_ARCH}/List/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Graph.3 \
		Graph::AdjacencyMap.3 \
		Graph::AdjacencyMap::Vertex.3 \
		Graph::AdjacencyMatrix.3 \
		Graph::BitMatrix.3 \
		Graph::Directed.3 \
		Graph::Matrix.3 \
		Graph::TransitiveClosure.3 \
		Graph::TransitiveClosure::Matrix.3 \
		Graph::Traversal.3 \
		Graph::Traversal::BFS.3 \
		Graph::Traversal::DFS.3 \
		Graph::Undirected.3 \
		Graph::UnionFind.3 \
		Heap071::Elem.3 \
		Heap071::Fibonacci.3

.include <bsd.port.mk>
