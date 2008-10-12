# New ports collection makefile for:    gnustep-guile
# Date created:         24 April 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $FreeBSD: ports/lang/gnustep-guile/Makefile,v 1.49 2006/03/19 04:35:45 dinoex Exp $
# $MidnightBSD: mports/lang/gnustep-guile/Makefile,v 1.5 2008/08/24 19:18:12 laffer1 Exp $
#

PORTNAME=	gnustep-guile
PORTVERSION=	1.1.4
PORTREVISION=	4444
CATEGORIES=	lang gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
PKGNAMESUFFIX?=	${NOX11_SUFFIX}${PKGNAMESUFFIX2}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep interface to the GUILE scheme interpreter
LICENSE=	gpl2

LIB_DEPENDS+=	guile.19:${PORTSDIR}/lang/guile

USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=
CONFIGURE_ARGS+=	--build=i386-portbld-freebsd6.0
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=
MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
MAKE_ENV+=	INSTALL_ROOT_DIR=${FAKE_DESTDIR}
PLIST_SUB+=	GUILE_VER="${GUILE_VER}"

MAN1=	greg.1
FIXME=	Library/gg_class.m ScriptKit/Library/GuileInterpreter.m

.if defined(WITHOUT_X11)
NOX11_SUFFIX?=	-nox11
USE_GNUSTEP_BASE=	yes
PLIST_SUB+=		USEX11="@comment "
CONFLICTS?=		gnustep-guile-1.*
.else
USE_GNUSTEP_BACK=	yes
PLIST_SUB+=		USEX11=""
CONFLICTS?=		gnustep-guile-nox11-1.*
.endif

.include <bsd.port.pre.mk>

GUILE_VER!=	(cd ${PORTSDIR}/lang/guile && make -V GUILE_VER)

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' \
		${WRKSRC}/Greg/configure
.for i in ${FIXME}
	@${REINPLACE_CMD} -e 's|scm_catch_body_t|scm_t_catch_body|' \
		-e 's|scm_catch_handler_t|scm_t_catch_handler|' \
		-e 's|scm_intern|scm_c_define|' \
		${WRKSRC}/${i}
.endfor
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}

pre-configure:
	@${TOUCH} ${WRKSRC}/Greg/ac_nonexistent.h

.include <bsd.port.post.mk>
