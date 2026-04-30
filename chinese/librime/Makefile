PORTNAME=	librime
DISTVERSION=	1.16.1
PORTREVISION=	1
CATEGORIES=	chinese textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rime Input Method Engine, the core library
WWW=		https://rime.github.io/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/include/boost/version.hpp:devel/boost-libs

LIB_DEPENDS=	libgflags.so:devel/gflags \
		libglog.so:devel/glog \
		libleveldb.so:databases/leveldb \
		libmarisa.so:devel/marisa-trie \
		libopencc.so:chinese/opencc \
		libyaml-cpp.so:devel/yaml-cpp

USES=		cmake compiler:c++17-lang perl5 pathfix pkgconfig
USE_PERL5=	build patch
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	rime

PLIST_SUB=	VER=${DISTVERSION}

CMAKE_OFF=	CMAKE_CXX_EXTENSIONS \
		BUILD_TEST

post-patch:
	@${FIND} ${WRKSRC} \( -name '*.cc' -or -name '*.h' \) \
		-exec ${PERL} -i -pe '$$. == 1 && s/^\xef\xbb\xbf//;' {} \;

.include <bsd.port.mk>
