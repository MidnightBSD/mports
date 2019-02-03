# $MidnightBSD$
# $FreeBSD: head/multimedia/cuse4bsd-kmod/Makefile 382254 2015-03-25 17:36:47Z marino $

PORTNAME=	cuse4bsd-kmod
PORTVERSION=	0.1.36
CATEGORIES=	multimedia
MASTER_SITES=	http://www.selasky.org/hans_petter/distfiles/ \
		http://home.selasky.org:8192/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cuse4BSD character device loopback driver for userspace

LICENSE=	bsd2

CONFLICTS=	video4bsd-kmod*

KMODNAME=	cuse4bsd
LIBDIR=		${PREFIX}/lib
INCLUDEDIR=	${PREFIX}/include
MANDIR=		${PREFIX}/man/man
USE_LDCONFIG=	yes

PLIST_SUB=	KMODNAME="${KMODNAME}" \
		LIBDIR="${LIBDIR}" \
		INCLUDEDIR="${INCLUDEDIR}" \
		MANDIR="${MANDIR}"

OPTIONS_DEFINE=	DEBUG

USES=		kmod tar:bzip2 uidfix

.include <bsd.mport.options.mk>

MAKE_ARGS+=	PTHREAD_LIBS="-lpthread"

.if ${PORT_OPTIONS:MDEBUG}
MAKE_ARGS+=	HAVE_DEBUG="YES"
.endif

do-install:
	${SETENV} ${MAKE_ENV} DESTDIR="${FAKE_DESTDIR}" ${MAKE} -C ${WRKSRC} -f ${WRKSRC}/Makefile.lib ${PLIST_SUB} install
	${INSTALL_KLD} ${WRKSRC}/${KMODNAME}.ko ${KMODDIR}

.include <bsd.port.mk>
