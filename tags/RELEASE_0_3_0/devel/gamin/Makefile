# $MidnightBSD: mports/devel/gamin/Makefile,v 1.7 2009/09/20 01:20:26 laffer1 Exp $

PORTNAME=	gamin
PORTVERSION=	0.1.10
PORTREVISION?=	1
CATEGORIES?=	devel
MASTER_SITES=	http://people.gnome.org/~veillard/gamin/sources/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	A file and directory monitoring system
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GNOME?=	gnomehack _glib20
USE_LDCONFIG=	yes
CONFIGURE_ARGS?=--with-html-dir=${PREFIX}/share/doc \
		--without-python
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -DHAVE_LINUX" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"
CPPFLAGS=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}

CONFLICTS=	fam-[0-9]*

GNU_CONFIGURE=	yes

.if !defined(GAMIN_SLAVE)
OPTIONS=	GAM_POLLER "Use gamin's poller instead of kqueue's" off
.endif

.include <bsd.port.pre.mk>

.if !defined(GAMIN_SLAVE)
.if defined(WITH_GAM_POLLER)
CPPFLAGS+=	-DUSE_GAMIN_POLLER=1
.endif
.endif

post-patch:
	@${REINPLACE_CMD} "s|/etc|${PREFIX}/etc|g" ${WRKSRC}/server/gam_conf.c

post-install:
	${INSTALL} ${WRKSRC}/server/gam_server ${PREFIX}/libexec/

.if !defined(GAMIN_SLAVE)
regression-test: build
	@${ECHO_MSG} "===> Running gamin regression tests"
	@(cd ${WRKSRC}/tests && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
		Makefile ${MAKE_ARGS} tests)

.endif

.include <bsd.port.post.mk>
