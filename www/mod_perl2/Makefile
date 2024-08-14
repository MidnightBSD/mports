PORTNAME=	mod_perl
PORTVERSION=	2.0.12
PORTEPOCH=	3
CATEGORIES=	www perl5
MASTER_SITES=	APACHE/perl
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embeds a Perl interpreter in the Apache server
WWW=		https://perl.apache.org/

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-BSD-Resource>=0:devel/p5-BSD-Resource
RUN_DEPENDS:=	${BUILD_DEPENDS}

TEST_DEPENDS=	p5-CGI>=4.15:www/p5-CGI \
		p5-libwww>=6.13:www/p5-libwww

SUB_FILES=	pkg-message ${APMOD_FILE}
SUB_LIST=	APACHEMODDIR=${APACHEMODDIR}
USES=		apache:2.4+ cpe gmake perl5
USE_PERL5=	configure
USE_APACHE=	24+
USE_CSTD=	gnu89
CPE_VENDOR=	apache

APMOD_FILE=	260_${PORTNAME}.conf.sample
PLIST_SUB+=	APMOD_FILE=${APMOD_FILE}

# Using apxs in this way is problematic if apache2 is installed under a
# different PREFIX than mod_perl2, because the mod_perl2 installation will
# use paths returned by apxs to install some components. Fixes welcome.
CONFIGURE_ARGS=	MP_APXS=${LOCALBASE}/sbin/apxs PREFIX=${PREFIX}

.include <bsd.port.pre.mk>

post-patch:
	${REINPLACE_CMD} -e 's/APR_INLINE//g' \
		${PATCH_WRKSRC}/src/modules/perl/modperl_common_util.h
	${REINPLACE_CMD} -e "s|/usr/local/apache/bin/apxs|${APXS}|" \
		-e "s|'bin', 'apxs'|'sbin', 'apxs'|" \
		${WRKSRC}/lib/Apache2/Build.pm

pre-configure:
	${FIND} ${WRKSRC} -type f \( -name \*.bak -o -name \*.orig \) -delete

# PR 200697: Test whether the system uses a multithreaded perl
.if exists(${PERL})
HAS_ITHREADS!=	${PERL} -e 'use Config; print $$Config{useithreads} ? 1 : 0'
.else
# Assume true when building packages.
HAS_ITHREADS=	1
.endif

.if ${HAS_ITHREADS:M1}
PLIST_SUB+=	ITHREADS=""
.else
PLIST_SUB+=	ITHREADS="@comment "
. if ${APACHE_VERSION:M24}
IGNORE=		requires PERL with "THREADS=on", please rebuild PERL and all depending ports
. endif
.endif

post-configure:
	${REINPLACE_CMD} -e 's/-pthread -Wl,-E//g' \
		${PATCH_WRKSRC}/xs/APR/APR/Makefile
	@${ECHO_CMD} == PERL: \"${PERL_VER}\", ITHREADS: \"${HAS_ITHREADS}\", Apache: \"${APACHE_VERSION}\"

post-install:
	${MKDIR} ${PREFIX}/${APACHEINCLUDEDIR}/modules/perl
	${INSTALL_DATA} ${WRKSRC}/src/modules/perl/*.h \
		${PREFIX}/${APACHEINCLUDEDIR}/modules/perl
	${INSTALL_DATA} ${WRKSRC}/xs/*.h ${PREFIX}/${APACHEINCLUDEDIR}
	${INSTALL_DATA} ${WRKSRC}/xs/APR/PerlIO/*.h ${PREFIX}/${APACHEINCLUDEDIR}
	${MKDIR} ${PREFIX}/${APACHEMODDIR}
	${INSTALL_PROGRAM} ${WRKSRC}/src/modules/perl/mod_perl.so \
		${PREFIX}/${APACHEMODDIR}/mod_perl.so
	${MKDIR} ${PREFIX}/${APACHEETCDIR}/modules.d
	${INSTALL_DATA} ${WRKDIR}/${APMOD_FILE} ${PREFIX}/${APACHEETCDIR}/modules.d

	${APXS} -e -A -n perl ${PREFIX}/${APACHEMODDIR}/mod_perl.so

.include <bsd.port.post.mk>
