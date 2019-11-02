PORTNAME=	elixir
DISTVERSIONPREFIX=	v
DISTVERSION=	1.9.2
CATEGORIES=	lang
#MASTER_SITES+=	https://github.com/elixir-lang/elixir/releases/download/${DISTVERSIONPREFIX}${PORTVERSION}/:doc
#DISTFILES=	Docs.zip:doc
DIST_SUBDIR=	elixir/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Functional, meta-programming aware language built on top of Erlang VM

LICENSE=	apache2

FAKE_OPTS+=	trueprefix

BUILD_DEPENDS=	erlang>=21.3:lang/erlang
RUN_DEPENDS=	erlang>=21.3:lang/erlang

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	elixir-lang

USE_LOCALE=	en_US.UTF-8
ALL_TARGET=	# empty
REINPLACE_ARGS=	-i ""
NO_ARCH=	yes
OPTIONS_SUB=	yes
MAKE_ENV=	MAN_PREFIX=${PREFIX}/man

OPTIONS_DEFINE=	SRC
OPTIONS_DEFAULT=SRC

SRC_DESC=	Install source code

.include <bsd.mport.options.mk>

post-install-SRC-on:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/elixir/lib
	cd ${WRKSRC}/lib/ && for lib in *; do \
		${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/elixir/lib/$${lib}/lib; \
		cd ${WRKSRC}/lib/$${lib}/lib && \
			${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${PREFIX}/lib/elixir/lib/$${lib}/lib; \
	done

do-test:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} test

.include <bsd.port.mk>
