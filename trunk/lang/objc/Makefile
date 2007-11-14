# New ports collection makefile for:    objc compiler
# Date created:         14 Nov 2007
# Whom:                 Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/lang/objc/Makefile,v 1.1 2007/11/14 23:18:39 laffer1 Exp $
# $FreeBSD: ports/lang/objc/Makefile,v 1.34 2007/11/14 19:39:34 stas Exp $
#

PORTNAME=	objc
PORTVERSION=	3.2.8
CATEGORIES=	lang
MASTER_SITES=	http://users.pandora.be/stes/
DISTFILES=	objc-bootstrap-${BOOTVERSION}.tar.gz objc-${PORTVERSION}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable Object Compiler
LICENSE=	gpl2

BOOTVERSION=	3.2.8

ALL_TARGET=	default
MAKE_ENV=	PATH=${WRKDIR}/bin:${PATH}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	PATH=${WRKDIR}/bin:${PATH}
USE_GCC=	3.4

FAKE_MAKEARGS+=	INSTALLDIR=${FAKE_DESTDIR}${PREFIX}

# if we ever upgrade gcc, be sure to add a depends for gcc 3.x

.include <bsd.port.pre.mk>

pre-configure:
	cd ${WRKDIR}/${PORTNAME}-bootstrap-${BOOTVERSION};\
	${CONFIGURE_ENV} ./configure --build=${ARCH}-portbld-freebsd6.0 --prefix=${WRKDIR};${MAKE};${MAKE} install

pre-install:
	${MKDIR} ${PREFIX}/share/doc/objc
	${MKDIR} ${PREFIX}/share/doc/objc/examples
	${MKDIR} ${PREFIX}/share/doc/objc/html
	${TAR} -cf - -C ${WRKSRC}/examples . | ${TAR} xpf - -C ${PREFIX}/share/doc/objc/examples
	${TAR} -cf - -C ${WRKSRC}/html . | ${TAR} xpf - -C ${PREFIX}/share/doc/objc/html

.include "${FILESDIR}/manpages.mk"

.include <bsd.port.post.mk>
