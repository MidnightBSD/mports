# $MidnightBSD$

PORTNAME=	mod_perl
PORTVERSION=	2.0.10
PORTEPOCH=	3
CATEGORIES=	www perl5
MASTER_SITES=	APACHE/perl
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embeds a Perl interpreter in the Apache server

LICENSE=	apache2

BUILD_DEPENDS=	p5-BSD-Resource>=0:devel/p5-BSD-Resource
RUN_DEPENDS:=	${BUILD_DEPENDS}

TEST_DEPENDS=	p5-CGI>=4.15:www/p5-CGI \
		p5-libwww>=6.13:www/p5-libwww

SUB_FILES=	pkg-message
SUB_LIST=	APACHEMODDIR=${APACHEMODDIR}
USES=		cpe gmake perl5
USE_APACHE=	22+
PERL_CONFIGURE=	yes
USE_CSTD=	gnu89
CPE_VENDOR=	apache

CSTD=	c89

# Using apxs in this way is problematic if apache2 is installed under a
# different PREFIX than mod_perl2, because the mod_perl2 installation will
# use paths returned by apxs to install some components. Fixes welcome.
CONFIGURE_ARGS=	MP_APXS=${LOCALBASE}/sbin/apxs PREFIX=${PREFIX}

.include <bsd.port.pre.mk>

.if defined(APR_H)
APR_HAS_THREADS!=	${ECHO_CMD} `${GREP} -c 'APR_HAS_THREADS *1' ${APR_H}`
.else
APR_HAS_THREADS=	0
.endif

.if ${APR_HAS_THREADS} == 1
PLIST_SUB+=	THREADMUTEX=""
PLIST_SUB+=	THREADRWLOCK=""
.else
PLIST_SUB+=	THREADMUTEX="@comment "
PLIST_SUB+=	THREADRWLOCK="@comment "
.endif

post-patch:
	${REINPLACE_CMD} -e 's/APR_INLINE//g' \
		${PATCH_WRKSRC}/src/modules/perl/modperl_common_util.h

post-configure:
	${REINPLACE_CMD} -e 's/-pthread -Wl,-E//g' \
		${PATCH_WRKSRC}/xs/APR/APR/Makefile

post-install:
	${MKDIR} ${PREFIX}/${APACHEINCLUDEDIR}/modules/perl
	${INSTALL_DATA} ${WRKSRC}/src/modules/perl/*.h \
		${PREFIX}/${APACHEINCLUDEDIR}/modules/perl
	${INSTALL_DATA} ${WRKSRC}/xs/*.h ${PREFIX}/${APACHEINCLUDEDIR}
	${INSTALL_DATA} ${WRKSRC}/xs/APR/PerlIO/*.h ${PREFIX}/${APACHEINCLUDEDIR}
	${MKDIR} ${PREFIX}/${APACHEMODDIR}
	${INSTALL_PROGRAM} ${WRKSRC}/src/modules/perl/mod_perl.so \
		${PREFIX}/${APACHEMODDIR}/mod_perl.so

	${APXS} -e -A -n perl ${PREFIX}/${APACHEMODDIR}/mod_perl.so

.include <bsd.port.post.mk>
