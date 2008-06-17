# New ports collection makefile for:	tcl8.0
# Date created:		19 August 1997
# Whom:			jkh
#
# $MidnightBSD: mports/lang/tcl80/Makefile,v 1.6 2008/05/11 16:19:47 laffer1 Exp $
# $FreeBSD: ports/lang/tcl80/Makefile,v 1.43 2007/03/13 10:31:46 miwi Exp $
#

PORTNAME=	tcl
PORTVERSION=	8.0.5
PORTREVISION=	3
CATEGORIES=	lang tcl
MASTER_SITES=	${MASTER_SITE_TCLTK}
MASTER_SITE_SUBDIR=tcl8_0
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool Command Language
LICENSE=	other

NO_LATEST_LINK=	yes
WRKSRC=		${WRKDIR}/tcl8.0.5/unix
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --build=${ARCH}-portbld-freebsd6.0
CONFIGURE_TARGET= ${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	PORTSDIR=${PORTSDIR}

SHLIB_MAJOR=	1
SHLIB_MINOR=	5
MAKEFILE=	makefile
TCL_LIB=	libtcl80.so

DESTDIRNAME=	INSTALL_ROOT

OPTIONS=	TCL80_MAN "Install tcl 8.0 manpages" off \
		TCLSH_WRAPPER "Require tclsh wrapper from ports" off

.include <bsd.port.pre.mk>

.if defined(WITH_TCLSH_WRAPPER)
RUN_DEPENDS+=		tclsh:${PORTSDIR}/lang/tcl-tk-wrapper
.endif

.if !defined(NO_INSTALL_MANPAGES) && defined(WITH_TCL80_MAN)
.include "${FILESDIR}/manpages"
MANCOMPRESSED=	yes
.endif

post-configure:
	@${CP} ${FILESDIR}/Makefile.lib ${WRKSRC}
	@${CP} ${FILESDIR}/makefile     ${WRKSRC}

pre-build:
	@cd ${WRKSRC} && ${MAKE} -f Makefile.lib PREFIX=${PREFIX} \
	   SHLIB_MAJOR=${SHLIB_MAJOR} SHLIB_MINOR=${SHLIB_MINOR} \
	   OSVERSION=${OSVERSION}

post-install:
.if !defined(NO_INSTALL_MANPAGES) && defined(WITH_TCL80_MAN)
	@cd ${WRKSRC} && ${MAKE} -f Makefile install-man
.endif
	${LN} -sf ${TCL_LIB}.${SHLIB_MAJOR} ${PREFIX}/lib/${TCL_LIB}

test:
	cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.post.mk>
