PORTNAME=	cvsweb
PORTVERSION=	3.0.6
PORTREVISION=	3
CATEGORIES=	devel www
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL} \
		http://people.FreeBSD.org/~scop/cvsweb/
MASTER_SITE_SUBDIR=	scop

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WWW CGI script to browse CVS repository trees version 3
WWW=		https://www.FreeBSD.org/projects/cvsweb.html

LICENSE=	bsd2

RUN_DEPENDS=	p5-IPC-Run>=0:devel/p5-IPC-Run \
		p5-URI>=0:net/p5-URI

# The following extra dependencies are optional, but CVSweb works the
# best with them.
RUN_DEPENDS+=	p5-MIME-Types>=0:mail/p5-MIME-Types \
		p5-String-Ediff>=0:devel/p5-String-Ediff \
		cvsgraph:devel/cvsgraph

# Use PAPERSIZE to avoid a stale dependency on Enscript.
PAPERSIZE?=	letter
RUN_DEPENDS+=	enscript:print/enscript-${PAPERSIZE}

CONFLICTS=	cvsweb-2.*

USES=		cpe perl5 shebangfix
SHEBANG_FILES=	cvsweb.cgi

CPE_VENDOR=	freebsd

NO_BUILD=	yes
NO_ARCH=	yes

.include <bsd.port.pre.mk>

# Specify where your repository belongs.
# (You can reconfigure it after installation anyway)
.if defined(PACKAGE_BUILDING) || !defined(CVSROOT) || empty(CVSROOT)
CVSROOT=	/home/cvs
.endif

# Specify the title of your cvsweb site.
TITLE?=		My CVS Repository

# Specify these directories in relative paths to ${PREFIX}.
.if exists(${TRUE_PREFIX}/www/cgi-bin)
CGIDIR?=	www/cgi-bin
ICONSDIR?=	www/icons
CSSDIR?=	www/data/css
.elif exists(${TRUE_PREFIX}/www/apache22/cgi-bin)
CGIDIR?=       www/apache22/cgi-bin
ICONSDIR?=     www/apache22/icons
CSSDIR?=       www/apache22/data/css
.elif exists(${TRUE_PREFIX}/apache/cgi-bin)
CGIDIR?=	apache/cgi-bin
ICONSDIR?=	apache/icons
CSSDIR?=	apache/data/css
.else
CGIDIR?=	share/apache/cgi-bin
ICONSDIR?=	share/apache/icons
CSSDIR?=	share/apache/data/css
.endif

CONFFILES=	cvsweb.conf \
		cvsweb.conf-freebsd \
		cvsweb.conf-openbsd \
		cvsweb.conf-netbsd \
		cvsweb.conf-ruby

PLIST_SUB=	CGIDIR="${CGIDIR}" ICONSDIR="${ICONSDIR}" CSSDIR="${CSSDIR}"

SUB_FILES=	pkg-message
SUB_LIST=	PREFIX="${PREFIX}" DOCSDIR="${DOCSDIR}"

post-patch:
	${REINPLACE_CMD} -e 's,/usr/local/etc/,${PREFIX}/etc/,' \
		-e 's,\(qw(hi.*)\),(\1),' ${WRKSRC}/cvsweb.cgi
	${REINPLACE_CMD} -e 's,!!PREFIX!!,${PREFIX},' \
			-e 's,!!CVSROOT!!,${CVSROOT},' \
			-e 's,!!TITLE!!,${TITLE},' \
			${WRKSRC}/cvsweb.conf

do-install:
	${MKDIR} ${PREFIX}/${CGIDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/cvsweb.cgi ${PREFIX}/${CGIDIR}/
	${MKDIR} ${PREFIX}/etc/cvsweb
.for f in ${CONFFILES}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/etc/cvsweb/${f}.dist
.endfor
	${MKDIR} ${PREFIX}/${ICONSDIR}/cvsweb
	${INSTALL_DATA} ${WRKSRC}/icons/* ${PREFIX}/${ICONSDIR}/cvsweb/
	${MKDIR} ${PREFIX}/${CSSDIR}/cvsweb
	${INSTALL_DATA} ${WRKSRC}/css/*.css ${PREFIX}/${CSSDIR}/cvsweb/
	${MKDIR} ${PREFIX}/share/enscript/hl
	${INSTALL_DATA} ${WRKSRC}/enscript/*.st ${PREFIX}/share/enscript/hl/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ChangeLog INSTALL NEWS README TODO
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/samples/* ${EXAMPLESDIR}/
.endif

post-install:
	${ECHO_CMD} "@unexec rmdir -p %D/${CGIDIR} %D/${ICONSDIR} %D/${CSSDIR} 2>/dev/null || true" >> ${TMPPLIST}

.include <bsd.port.post.mk>
