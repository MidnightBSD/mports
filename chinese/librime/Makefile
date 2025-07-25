PORTNAME=	librime
PORTVERSION=	1.11.2
PORTREVISION=	4
CATEGORIES=	chinese textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rime Input Method Engine, the core library
WWW=		https://rime.github.io/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libboost_thread.so:devel/boost-libs \
		libcapnp.so:devel/capnproto \
		libgflags.so:devel/gflags \
		libglog.so:devel/glog \
		libleveldb.so:databases/leveldb \
		libmarisa.so:devel/marisa-trie \
		libopencc.so:chinese/opencc \
		libyaml-cpp.so:devel/yaml-cpp \

USES=		cmake compiler:c++14-lang gettext pathfix perl5 pkgconfig xorg
USE_PERL5=	build patch

CMAKE_OFF=	BUILD_TEST

USE_CXXSTD=	c++14
USE_LDCONFIG=	yes
USE_XORG=	xorgproto
USE_GITHUB=	yes
GH_ACCOUNT=	rime

PLIST_SUB=	VER=${PORTVERSION}

post-patch:
	@${FIND} ${WRKSRC} \( -name '*.cc' -or -name '*.h' \) \
		-exec ${PERL} -i -pe '$$. == 1 && s/^\xef\xbb\xbf//;' {} \;

.include <bsd.port.mk>
